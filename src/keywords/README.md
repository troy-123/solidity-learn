# fallback
**execute conditions**
- a function that does not exist is called or
- Ether is sent directly to a contract but receive() does not exist or msg.data is not empty

# assembly
**Code example**
```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract AssemblyVariable {
    function yul_let() public pure returns (uint z) {
        assembly {
            // Language used for assembly is called Yul
            // Local variables
            let x := 123
            z := 456
        }
    }
}
```
There are other assembly example codes like AssemblyIf, AssemblyLoop, AssemblyError, AssemblyMath https://solidity-by-example.org/assembly-variable/
### Features
**Low-level control**
```
Assembly gives you more control over the EVM than you can achieve with standard Solidity statements. This allows you to perform tasks that are not possible using Solidity alone.
```
**Gas optimization**
```
Assembly can be used to optimize the gas cost of your smart contract. By directly interacting with the EVM, you can avoid the overhead of using Solidity's built-in functions and libraries.
```
**Complexity**
```
Assembly code is much more complex and difficult to understand than Solidity code. This is because it is closer to the machine code that the EVM understands.
```
**Security risk**
```
Using assembly can introduce security vulnerabilities into your smart contract. This is because you are bypassing Solidity's safety checks and directly interacting with the EVM.
```
### Using situations
- Optimizing gas efficiency for critical functions.
- Interacting with external contracts that require low-level access to the EVM.
- Implementing custom logic that is not possible with standard Solidity statements.


# unchecked
**Code example**
```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract UncheckedMath {
    function add(uint x, uint y) external pure returns (uint) {
        // 22291 gas
        // return x + y;

        // 22103 gas
        unchecked {
            return x + y;
        }
    }

    function sub(uint x, uint y) external pure returns (uint) {
        // 22329 gas
        // return x - y;

        // 22147 gas
        unchecked {
            return x - y;
        }
    }

    function sumOfCubes(uint x, uint y) external pure returns (uint) {
        // Wrap complex math logic inside unchecked
        unchecked {
            uint x3 = x * x * x;
            uint y3 = y * y * y;

            return x3 + y3;
        }
    }
}

```
**Gas savings**
```
1.Disabling overflow/underflow checks can save a significant amount of gas, especially for operations involving large numbers. This is because the checks require additional instructions to be executed, which consume gas.
2.The gas savings can be substantial, especially for loops with many iterations or calculations involving large numbers.
```
**Risks**
```
1.Disabling overflow/underflow checks can lead to unexpected behavior and vulnerabilities in your smart contract.
2.If an overflow or underflow occurs, the contract may execute unintended code or become stuck in an infinite loop.
3.This can lead to the loss of funds or other undesirable outcomes.
```
**Alternatives**
```
There are safer alternatives to disabling overflow/underflow checks, such as:
1.Using libraries that perform safe math operations.
2.Implementing your own checks with asserts or require statements.
3.Limiting the range of values that variables can hold.
```

# storage, memory, calldata

- **storage** - variable is a state variable (store on blockchain)
- **memory** - variable is in memory and it exists while a function is being called
- **calldata** - special data location that contains function arguments
```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract DataLocations {
    uint[] public arr;
    mapping(uint => address) map;
    struct MyStruct {
        uint foo;
    }
    mapping(uint => MyStruct) myStructs;

    function f(uint[] calldata _arr) public {
        // call _f with state variables
        _f(arr, map, myStructs[1]);

        // get a struct from a mapping
        MyStruct storage myStruct = myStructs[1];
        // create a struct in memory
        MyStruct memory myMemStruct = MyStruct(0);
    }

    function _f(
        uint[] storage _arr,
        mapping(uint => address) storage _map,
        MyStruct storage _myStruct
    ) internal {
        // do something with storage variables
    }
}

```