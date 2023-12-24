// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MyString {

    function concat(string calldata s1, string calldata s2) public pure returns(string memory){
        return string(abi.encodePacked(s1,s2));
    }

    function getStrAtIndex(string calldata s1, uint256 index) public pure returns(string memory){
        bytes memory s1InBytes = bytes(s1);
        require(index < s1InBytes.length, "index exceeds the length of s1");

        bytes memory strInBytes = new bytes(1);
        strInBytes[0] = bytes(s1)[index];

        return string(strInBytes);
    }

    function replaceStrAtIndex(string memory s1, string memory c1, uint256 index) public pure returns(string memory){
        bytes memory s1InBytes = bytes(s1);
        require(index < s1InBytes.length, "index exceeds the length of s1");

        bytes memory c1InBytes = bytes(c1);
        require(c1InBytes.length==1, "length of c1 not equal to 1");
        
        s1InBytes[index] = c1InBytes[0];

        return string(s1InBytes);
    }
}