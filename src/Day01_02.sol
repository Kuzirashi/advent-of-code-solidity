// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {console2} from "forge-std/Test.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";
import {Arrays} from "@openzeppelin/contracts/utils/Arrays.sol";
import {BytesLib} from "solidity-bytes-utils/BytesLib.sol";
import {LibString} from "solady/src/utils/LibString.sol";

import {Day01_01} from "./Day01_01.sol";

contract Day01_02 is Day01_01 {
    mapping(string => string) private replaceMap;
    string[9] private digitsWords;

    constructor() {
        digitsWords = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"];
        replaceMap["one"] = "o1e";
        replaceMap["two"] = "t2o";
        replaceMap["three"] = "t3e";
        replaceMap["four"] = "f4r";
        replaceMap["five"] = "f5e";
        replaceMap["six"] = "s6x";
        replaceMap["seven"] = "s7n";
        replaceMap["eight"] = "e8t";
        replaceMap["nine"] = "n9e";
    }

    function parseLine(string memory line) public view override returns (uint256) {
        for (uint256 index; index < digitsWords.length; index++) {
            line = LibString.replace(line, digitsWords[index], replaceMap[digitsWords[index]]);
        }

        return super.parseLine(line);
    }
}
