// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Day01} from "../src/Day01.sol";

contract Day01Test is Test {
    Day01 public counter;

    function setUp() public {
        counter = new Day01();
    }

    function test_Increment() public {
        counter.parseLine("dcjcj2");
    }
}
