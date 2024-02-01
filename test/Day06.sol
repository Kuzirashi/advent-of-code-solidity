// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Day06_01} from "../src/Day06_01.sol";

contract Day04Test is Test {
    Day06_01 public day06_01;

    function setUp() public {
        day06_01 = new Day06_01();
    }

    function test_day06_01_demo() public {
        uint256 result = 0;

        while (true) {
            string memory line = vm.readLine("./inputs/06_demo.txt");
            if (bytes(line).length == 0) {
                break;
            }

            uint256 line_result = day06_01.parseLine(line);
            result += line_result;
        }

        console2.log("Day 6_1 (demo): ", result);
        assertEq(result, 288);
    }

    function test_day06_01() public {
        uint256 result = 0;

        while (true) {
            string memory line = vm.readLine("./inputs/06.txt");
            if (bytes(line).length == 0) {
                break;
            }

            uint256 line_result = day06_01.parseLine(line);
            result += line_result;
        }

        console2.log("Day 6_1: ", result);
        assertEq(result, 1312850);
    }
}
