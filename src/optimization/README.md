# Optimization


## Keyword - unchecked
[unchecked in keywords](../keywords/README.md/#unchecked)

## Replacing memory with calldata
**Gas savings**

    Using calldata is significantly cheaper than using memory. This is because calldata is a read-only data area that is stored on the blockchain itself, while memory is a temporary data area that exists only during the execution of a function.
## Loading state variable to memory
- **Faster Access**
  
    Loading a state variable into memory can improve access speed. Memory access is generally faster than storage access, as memory is temporary, easily accessible, and located in the computer's internal cache.

- **Temporality**

    Loading a state variable into memory means that a copy of the variable will exist in memory rather than storage. This allows you to perform operations on the variable without modifying the storage state. This is useful for temporary calculations, storing intermediate results, and using local variables.

- **Cost-saving in Storage**

    Loading a state variable into memory can reduce the number of accesses to permanent storage, thereby saving storage costs. Storage access is relatively expensive, so using memory can reduce the frequency of storage accesses.
## Replace for loop i++ with ++i
**i++**
```
1.Returns the current value of i first.
2.Then performs the increment operation, increasing the value of i.
3.This requires creating a temporary variable to store the old value of i, which consumes more gas.
```
**++i**
```
1.Performs the increment operation first, increasing the value of i before returning it.
2.This avoids the need to create a temporary variable to store the old value of i.
```
**Gas savings**
```
1.The gas savings are relatively small, usually around 5 gas units.
2.However, in loops with many iterations, the accumulated savings can be significant.
3.Additionally, using ++i can improve code readability and efficiency.
```
## Caching array elements
- **Reduced Resource Consumption**

    When accessing the same array elements multiple times within a loop, caching them in local variables can avoid redundant accesses and computations.
```
uint num = nums[i];// Caching array elements, need to be read 3 times
if (num % 2 == 0 && num < 99) {
    _total += num;
}
```
## Short circuit
**before short circuit**
```
bool isEven = nums[i] % 2 == 0;
bool isLessThan99 = nums[i] < 99;// may cause extra resource consumption
if (isEven && isLessThan99) {
    total += nums[i];
}
```
**after short circuit**
```
if (num % 2 == 0 && num < 99) { // Short circuit
    _total += num;
}
```
## Precompute and inline the function selector
```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract FunctionSelector {
    /*
    "transfer(address,uint256)"
    0xa9059cbb
    "transferFrom(address,address,uint256)"
    0x23b872dd
    */
    function getSelector(string calldata _func) external pure returns (bytes4) {
        return bytes4(keccak256(bytes(_func)));
    }
}

```
## Keyword - assembly
[assembly in keywords](../keywords/README.md)

