## Info

I am getting errors when trying to deploy MUD's `CoreModule.sol`

Notes:

- CoreModule.sol has a factory dependency: CoreSystem.sol
- Both CoreModule.sol and CoreSystem.sol are compiling with --is-system flag
- The bytecodes are quite large (but not too large)
- Some of the requirements for zksync bytecode do not seem to be being met (like divisiblity by 32 etc).

## Set up

### Prerequisite

- Must have a <PRIVATE_KEY> with testnet funds.

### Installation

> **Note:** Installation steps include cloning the updated Foundry/zkSync Era application from the Pineapple Workshop repo, [**foundry-zksync**](https://github.com/pineappleworkshop/foundry-zksync.git), and the repro repo, [**factory-dep-size-issue**](https://github.com/sammyshakes/factory-dep-size-issue).

1. Create a top-level directory and `cd` into it.

```
mkdir fzksync && cd fzksync
```

2. Clone the repos into the same directory.

```sh
git clone -b zk-mud https://github.com/pineappleworkshop/foundry-zksync.git
git clone https://github.com/sammyshakes/factory-dep-size-issue.git
```

3. `cd` into the `foundry-zksync`.

```sh
cd foundry-zksync
cargo build -p foundry-cli
```

4. `cd` into the project folder or open a new terminal and navigate to the project folder.

```sh
cd ../factory-dep-size-issue
```

5. Build `CoreModule.sol`.

```sh
../foundry-zksync/target/debug/zkforge zkb --match-contract CoreModule.sol --is-system
```

6. Deploy `CoreModule.sol` to a zksync testnet.

- It is not necessary to enter factory dependencies in command line using `--factory-deps` flag.
- Updated version of Fundry/zkSync handles this automatically.

```sh
../foundry-zksync/target/debug/zkforge zkc src/CoreModule/CoreModule.sol:CoreModule --private-key <PRIVATE_KEY> --rpc-url https://testnet.era.zksync.dev --chain 280
```

```
Error:
Provider error: (code: 3, message: exceeds limit for published pubdata, data: Some(String("0x")))

Context:
- (code: 3, message: exceeds limit for published pubdata, data: Some(String("0x")))
```

## Additional Information

For reference, two files are created containing the bytecodes of `CoreModule.sol` and `CoreSystem.sol`:

- bytecode_main.txt
- bytecode_dep.txt

To calculate bytes from each bytecode generated run `calcBytes.js` for each bytecode file:

```sh
# CoreModule.sol
node calcBytes.js bytecode_main.txt
```

output:

```
File path: bytecode_main.txt
Memory size (bytes): 204106
Memory size (KB): 199.322265625
Memory size (MB): 0.19465065002441406
Memory size is divisible by 32: false
Remainder: 10
number of word raw: 6378.3125
Number of words: 6379
Number of words is odd: true
```

```sh
# CoreSystem.sol
node calcBytes.js bytecode_dep.txt
```

output:

```
File path: bytecode_dep.txt
Memory size (bytes): 280645
Memory size (KB): 274.0673828125
Memory size (MB): 0.26764392852783203
Memory size is divisible by 32: false
Remainder: 5
number of word raw: 8770.15625
Number of words: 8771
Number of words is odd: true
```

- After calculating, it falls within the size limitation of zksync (2^16 = 65536) words, which there are only about 15k words between the main contract bytecode and the factory dep bytecode
