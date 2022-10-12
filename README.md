# 🔐 Ethernaut CTFs challenges and solutions

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
```sh
ethernaut git:(main) ✗ forge test                                                      
[⠢] Compiling...
[⠔] Compiling 8 files with 0.6.12
[⠑] Solc 0.6.12 finished in 1.24s
Compiler run successful

Running 1 test for test/FallbackExploit.sol:FallbackExploit
[PASS] testExploit() (gas: 787126)
Test result: ok. 1 passed; 0 failed; finished in 433.08µs
```

## 🛡 Levels

| N° | Name | Challenge | Solution |
| -- | ---- | --------- | -------- |
| 01 | Fallback | [link](https://ethernaut.openzeppelin.com/level/0x6F9cf195B9B4c1259E8FCe5b4e30F7142f779DeA) | [link](https://github.com/leovct/ethernaut/tree/main/test/FallbackExploit.sol) |
