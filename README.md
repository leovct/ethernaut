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
[⠆] Compiling...
[⠰] Compiling 9 files with 0.8.14
[⠒] Solc 0.8.14 finished in 1.01s
Compiler run successful

Running 1 test for test/FallbackExploit.sol:FallbackExploit
[PASS] testExploit() (gas: 787126)
Test result: ok. 1 passed; 0 failed; finished in 347.21µs
```
