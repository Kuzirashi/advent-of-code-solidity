// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Day01_01} from "../src/Day01_01.sol";
import {Day01_02} from "../src/Day01_02.sol";

contract Day01Test is Test {
    Day01_01 public day01_01;
    Day01_02 public day01_02;

    function setUp() public {
        day01_01 = new Day01_01();
        day01_02 = new Day01_02();
    }

    function test_day01_01() public {
        uint256 total_calibration_value = 0;

        while (true) {
            string memory line = vm.readLine("./inputs/01.txt");
            if (bytes(line).length == 0) {
                break;
            }

            uint256 line_calibration_value = day01_01.parseLine(line);
            total_calibration_value += line_calibration_value;
        }

        console2.log("Day 1_1: ", total_calibration_value);
        assertEq(total_calibration_value, 56049);
    }

    function test_day01_02() public {
        uint256 total_calibration_value = 0;

        while (true) {
            string memory line = vm.readLine("./inputs/01.txt");
            if (bytes(line).length == 0) {
                break;
            }

            uint256 line_calibration_value = day01_02.parseLine(line);
            total_calibration_value += line_calibration_value;
        }

        console2.log("Day 1_2: ", total_calibration_value);
        assertEq(total_calibration_value, 54530);
    }
}
