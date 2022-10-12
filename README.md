# 🔐 Ethernaut CTFs challenges and solutions
Inspired by [ethernaut-x-foundry](https://github.com/ciaranmcveigh5/ethernaut-x-foundry)

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
ethernaut git:(main) ✗ forge test -vvv
[⠢] Compiling...
[⠘] Compiling 1 files with 0.6.12
[⠃] Solc 0.6.12 finished in 457.05ms
Compiler run successful

Running 1 test for test/FallbackExploit.sol:FallbackExploit
[PASS] testExploit() (gas: 788447)
Logs:
  Fallback contract owner: 0x185a4dc360ce69bdccee33b3784b0282f7961aea
  New Fallback contract owner: 0x0000000000000000000000000000000000000539
  Exploiter address: 0x0000000000000000000000000000000000000539
  Fallback contract balance: 2
  New Fallback contract balance: 0

Test result: ok. 1 passed; 0 failed; finished in 478.54µs
```

## 🛡 Levels

| N° | Name | Challenge | Solution |
| -- | ---- | --------- | -------- |
| 01 | Fallback | [link](https://ethernaut.openzeppelin.com/level/0x6F9cf195B9B4c1259E8FCe5b4e30F7142f779DeA) | [link](https://github.com/leovct/ethernaut/tree/main/test/FallbackExploit.sol) |
| 02 | Fallout | [link](https://ethernaut.openzeppelin.com/level/0x40F5513a90fb7e2ac2C3E12A6d16B9279D1e94Ed) | [link](https://github.com/leovct/ethernaut/tree/main/test/FalloutExploit.sol) |
