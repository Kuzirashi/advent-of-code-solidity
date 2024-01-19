// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Day03_01} from "../src/Day03_01.sol";
import {Day03_02} from "../src/Day03_02.sol";

contract Day03Test is Test {
    Day03_01 public day03_01;
    Day03_02 public day03_02;

    function setUp() public {
        day03_01 = new Day03_01();
        day03_02 = new Day03_02();
    }

    function test_day03_01_demo() public {
        while (true) {
            string memory line = vm.readLine("./inputs/03_demo.txt");
            if (bytes(line).length == 0) {
                break;
            }

            day03_01.parseLine(line);
        }

        uint256 result = day03_01.computeResult();
        console2.log("Day 3_1 (demo): ", result);
        assertEq(result, 4361);
    }

    function test_day03_01() public {
        while (true) {
            string memory line = vm.readLine("./inputs/03.txt");
            if (bytes(line).length == 0) {
                break;
            }

            day03_01.parseLine(line);
        }

        uint256 result = day03_01.computeResult();
        console2.log("Day 3_1: ", result);
        assertEq(result, 522726);
    }

    function test_day03_02_demo() public {
        while (true) {
            string memory line = vm.readLine("./inputs/03_demo.txt");
            if (bytes(line).length == 0) {
                break;
            }

            day03_02.parseLine(line);
        }

        uint256 result = day03_02.computeResult();
        console2.log("Day 3_2 (demo): ", result);
        assertEq(result, 467835);
    }

    function test_day03_02() public {
        while (true) {
            string memory line = vm.readLine("./inputs/03.txt");
            if (bytes(line).length == 0) {
                break;
            }

            day03_02.parseLine(line);
        }

        uint256 result = day03_02.computeResult();
        console2.log("Day 3_2: ", result);
        assertEq(result, 81721933);
    }
}
