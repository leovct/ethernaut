// SPDX-License-Identifier: MIT
// This file is an updated version of Ethernaut.sol that returns data in both functions:
// createLevelInstance and submitLevelInstance.

pragma solidity ^0.6.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "ethernaut/contracts/levels/base/Level.sol";

contract Ethernaut is Ownable {
	// ----------------------------------
	// Owner interaction
	// ----------------------------------

	mapping(address => bool) private registeredLevels;

	// Only registered levels will be allowed to generate and validate level instances.
	function registerLevel(Level _level) public onlyOwner {
		registeredLevels[address(_level)] = true;
	}

	// ----------------------------------
	// Get/submit level instances
	// ----------------------------------

	struct EmittedInstanceData {
		address player;
		Level level;
		bool completed;
	}

	mapping(address => EmittedInstanceData) private emittedInstances;

	event LevelInstanceCreatedLog(address indexed player, address instance);
	event LevelCompletedLog(address indexed player, Level level);

	function createLevelInstance(Level _level) public payable returns (address) {
		// Ensure level is registered.
		// solhint-disable-next-line reason-string
		require(registeredLevels[address(_level)]);

		// Get level factory to create an instance.
		address instance = _level.createInstance{value: msg.value}(msg.sender);

		// Store emitted instance relationship with player and level.
		emittedInstances[instance] = EmittedInstanceData(msg.sender, _level, false);

		// Retrieve created instance via logs.
		emit LevelInstanceCreatedLog(msg.sender, instance);

		// PATCH: return data because it's not possible to read emitted events via Solidity
		return instance;
	}

	function submitLevelInstance(address payable _instance) public returns (bool) {
		// Get player and level.
		EmittedInstanceData storage data = emittedInstances[_instance];
		// solhint-disable-next-line reason-string
		require(data.player == msg.sender); // instance was emitted for this player
		// solhint-disable-next-line reason-string
		require(data.completed == false); // not already submitted

		// Have the level check the instance.
		if (data.level.validateInstance(_instance, msg.sender)) {
			// Register instance as completed.
			data.completed = true;

			// Notify success via logs.
			emit LevelCompletedLog(msg.sender, data.level);

			// PATCH: return data because it's not possible to read emitted events
			return true;
		}

		// PATCH: return data because it's not possible to read emitted events
		return false;
	}
}
