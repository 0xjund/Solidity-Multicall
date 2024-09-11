//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract Multicall {
    function multicall(bytes[] calldata data) external returns (bytes[] memory results) {
      results = new bytes[](data.length);
      for (uint i = 0; i < data.length; i++) {
        (bool success, bytes memory result) = address(this).delegatecall(data[i]);
        require(success, "Multicall execution failed");
        results[i] = result;
      }
    }  
    function foo(uint256 x) external pure returns (uint256) {
      return x * 2; 
    }
    function bar(uint256 y) external pure returns (uint256) {
      return y + 3; 
    }
}
