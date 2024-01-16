// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Day02_01} from "../src/Day02_01.sol";
import {Day02_02} from "../src/Day02_02.sol";

contract Day02Test is Test {
    Day02_01 public day02_01;
    Day02_02 public day02_02;

    function setUp() public {
        day02_01 = new Day02_01();
        day02_02 = new Day02_02();
    }

    function test_day02_01() public {
        uint256 result = 0;

        while (true) {
            string memory line = vm.readLine("./inputs/02.txt");
            if (bytes(line).length == 0) {
                break;
            }

            result += day02_01.parseLine(line);
        }

        console2.log("Day 2_1: ", result);
        assertEq(result, 2237);
    }

    function test_day02_02() public {
        uint256 result = 0;

        while (true) {
            string memory line = vm.readLine("./inputs/02.txt");
            if (bytes(line).length == 0) {
                break;
            }

            result += day02_02.parseLine(line);
        }

        console2.log("Day 2_2: ", result);
        assertEq(result, 66681);
    }
}
