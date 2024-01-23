// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Day04_01} from "../src/Day04_01.sol";
import {Day04_02} from "../src/Day04_02.sol";

contract Day04Test is Test {
    Day04_01 public day04_01;
    Day04_02 public day04_02;

    function setUp() public {
        day04_01 = new Day04_01();
        day04_02 = new Day04_02();
    }

    function test_day04_01_demo() public {
        uint256 result = 0;

        while (true) {
            string memory line = vm.readLine("./inputs/04_demo.txt");
            if (bytes(line).length == 0) {
                break;
            }

            uint256 line_result = day04_01.parseLine(line);
            result += line_result;
        }

        console2.log("Day 4_1 (demo): ", result);
        assertEq(result, 13);
    }

    function test_day04_01() public {
        uint256 result = 0;

        while (true) {
            string memory line = vm.readLine("./inputs/04.txt");
            if (bytes(line).length == 0) {
                break;
            }

            uint256 line_result = day04_01.parseLine(line);
            result += line_result;
        }

        console2.log("Day 4_1: ", result);
        assertEq(result, 24542);
    }

    function test_day04_02_demo() public {
        while (true) {
            string memory line = vm.readLine("./inputs/04_demo.txt");
            if (bytes(line).length == 0) {
                break;
            }

            day04_02.parseLine(line);
        }

        uint256 result = day04_02.computeResult();
        console2.log("Day 4_2 (demo): ", result);
        assertEq(result, 30);
    }

    function test_day04_02() public {
        while (true) {
            string memory line = vm.readLine("./inputs/04.txt");
            if (bytes(line).length == 0) {
                break;
            }

            day04_02.parseLine(line);
        }

        uint256 result = day04_02.computeResult();
        console2.log("Day 4_2: ", result);
        assertEq(result, 8736438);
    }
}
