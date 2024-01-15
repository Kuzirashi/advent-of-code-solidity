// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {console2} from "forge-std/Test.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";
import {Arrays} from "@openzeppelin/contracts/utils/Arrays.sol";
import {BytesLib} from "solidity-bytes-utils/BytesLib.sol";
import {LibString} from "solady/src/utils/LibString.sol";

contract Day02_01 {
    function parseLine(string memory line) public view virtual returns (uint256) {
        string[] memory split = LibString.split(line, ":");
        string[] memory gameHeaderSplit = LibString.split(split[0], " ");
        string[] memory gameDataSplit = LibString.split(split[1], ";");

        uint256 maxRed;
        uint256 maxBlue;
        uint256 maxGreen;

        for (uint256 i; i < gameDataSplit.length; i++) {
            string[] memory splitByComma = LibString.split(gameDataSplit[i], ",");

            for (uint256 j; j < splitByComma.length; j++) {
                string[] memory cubeTupleSplit = LibString.split(splitByComma[j], " ");
                uint256 cubeAmount = stringToUint(cubeTupleSplit[1]);
                uint256 cubeColorLength = bytes(cubeTupleSplit[2]).length;

                if (cubeColorLength == 3 && cubeAmount > maxRed) {
                    maxRed = cubeAmount;
                } else if (cubeColorLength == 4 && cubeAmount > maxBlue) {
                    maxBlue = cubeAmount;
                } else if (cubeColorLength == 5 && cubeAmount > maxGreen) {
                    maxGreen = cubeAmount;
                }
            }
        }

        if (maxBlue <= 14 && maxGreen <= 13 && maxRed <= 12) {
            return stringToUint(gameHeaderSplit[1]);
        }
    }

    function stringToUint(string memory s) public pure returns (uint256) {
        bytes memory b = bytes(s);
        uint256 result = 0;
        for (uint256 i = 0; i < b.length; i++) {
            uint256 c = uint256(uint8(b[i]));
            if (c >= 48 && c <= 57) {
                result = result * 10 + (c - 48);
            }
        }
        return result;
    }
}
