// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Day02_01} from "../src/Day02_01.sol";

contract Day02Test is Test {
    Day02_01 public day02_01;

    function setUp() public {
        day02_01 = new Day02_01();
    }

    function test_day02_01() public {
        uint256 total_calibration_value = 0;

        while (true) {
            string memory line = vm.readLine("./inputs/02.txt");
            if (bytes(line).length == 0) {
                break;
            }

            uint256 line_calibration_value = day02_01.parseLine(line);
            total_calibration_value += line_calibration_value;
        }

        console2.log("Day 2_1: ", total_calibration_value);
        assertEq(total_calibration_value, 2237);
    }
}
