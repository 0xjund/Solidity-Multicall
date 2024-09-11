//SPDX-License-Identifer: MIT

pragma solidity ^0.8.18;

import { Test } from "forge-std/Test.sol";
import { Multicall } from "src/Multicall.sol";

contract MulticallTest is Test {
    Multicall multicall; 

    function setUp() public {
      multicall = new Multicall();
    }

    function testMulticall() public {
      bytes[] memory data = new bytes[](2);
      data[0] = abi.encodeWithSelector(multicall.foo.selector, 2);
      data[1] = abi.encodeWithSelector(multicall.bar.selector, 3); 

      bytes[] memory results = multicall.multicall(data);

      uint256 result0 = abi.decode(results[0], (uint256));
      uint256 result1 = abi.decode(results[1], (uint256));

      assertEq(result0, 4, "foo(2) should return 4");
      assertEq(result1, 6, "bar(3) should return 6"); 
    }
}

