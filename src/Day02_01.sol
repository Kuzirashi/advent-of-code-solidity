// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {LibString} from "solady/src/utils/LibString.sol";
import {LibBytesUint} from "./LibBytesUint.sol";

contract Day02_01 {
    uint8 constant MAXIMUM_ALLOWED_RED = 12;
    uint8 constant MAXIMUM_ALLOWED_GREEN = 13;
    uint8 constant MAXIMUM_ALLOWED_BLUE = 14;

    function parseLine(string calldata line) public view virtual returns (uint256) {
        uint256 indexOfColon = LibString.indexOf(line, ":", 6);
        string[] memory gameDataSplit = LibString.split(string(bytes(line[indexOfColon:])), ";");

        uint256 maxRed;
        uint256 maxBlue;
        uint256 maxGreen;

        for (uint256 i; i < gameDataSplit.length; i++) {
            string[] memory splitByComma = LibString.split(gameDataSplit[i], ",");

            for (uint256 j; j < splitByComma.length; j++) {
                string[] memory cubeTupleSplit = LibString.split(splitByComma[j], " ");
                uint256 cubeAmount = LibBytesUint.bytesToUint(bytes(cubeTupleSplit[1]));
                uint256 cubeColorLength = bytes(cubeTupleSplit[2]).length;

                if (cubeColorLength == 3 && cubeAmount > maxRed) {
                    if (cubeAmount > MAXIMUM_ALLOWED_RED) {
                        return 0;
                    }

                    maxRed = cubeAmount;
                } else if (cubeColorLength == 4 && cubeAmount > maxBlue) {
                    if (cubeAmount > MAXIMUM_ALLOWED_BLUE) {
                        return 0;
                    }

                    maxBlue = cubeAmount;
                } else if (cubeColorLength == 5 && cubeAmount > maxGreen) {
                    if (cubeAmount > MAXIMUM_ALLOWED_GREEN) {
                        return 0;
                    }

                    maxGreen = cubeAmount;
                }
            }
        }

        if (maxBlue <= MAXIMUM_ALLOWED_BLUE && maxGreen <= MAXIMUM_ALLOWED_GREEN && maxRed <= MAXIMUM_ALLOWED_RED) {
            bytes calldata gameIdBytes = bytes(line[5:indexOfColon]);

            return LibBytesUint.bytesToUint(gameIdBytes);
        }

        return 0;
    }
}
