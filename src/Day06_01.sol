// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {LibString} from "solady/src/utils/LibString.sol";
import {LibBytesUint} from "./LibBytesUint.sol";

struct Race {
    uint256 time;
    uint256 distance;
}

contract Day06_01 {
    Race[] public races;
    uint256 lineIndex;

    function splitWhitespace(string calldata subject) internal pure returns (string[] memory result) {
        uint256[] memory indices = LibString.indicesOf(subject, " ");

        result = new string[](10);
        uint256 nonConsecutiveIndicesStringsLength = 0;
        uint256 previousIndice = 9999;
        uint256 lastUsedIndice = 0;
        uint256 startingStreakIndice = 0;

        for (uint256 i = 0; i < indices.length; i++) {
            if (previousIndice + 1 != indices[i]) {
                uint256 startSliceIndex = startingStreakIndice == 0 ? 0 : startingStreakIndice + 1;

                result[nonConsecutiveIndicesStringsLength] = subject[startSliceIndex:indices[i]];
                nonConsecutiveIndicesStringsLength++;

                lastUsedIndice = indices[i];
            } else if (i + 1 == indices.length) {
                result[nonConsecutiveIndicesStringsLength] = subject[indices[i] + 1:bytes(subject).length];
                nonConsecutiveIndicesStringsLength++;
            } else {
                startingStreakIndice = indices[i];
            }

            previousIndice = indices[i];
        }
    }

    function parseLine(string calldata line) public virtual returns (uint256 result) {
        string[] memory splitByWhitespace = splitWhitespace(line);

        for (uint256 i = 1; i < splitByWhitespace.length; i++) {
            if (bytes(splitByWhitespace[i]).length == 0) {
                break;
            }

            if (lineIndex == 0) {
                // time
                races.push(Race(LibBytesUint.bytesToUint(bytes(splitByWhitespace[i])), 0));
            } else {
                // distance
                Race storage _race = races[i - 1];
                _race.distance = LibBytesUint.bytesToUint(bytes(splitByWhitespace[i]));
            }
        }

        lineIndex++;

        if (lineIndex == 2) {
            result = 1;

            for (uint256 i = 0; i < races.length; i++) {
                uint256 waysToWin = 0;

                for (uint256 j = 0; j < races[i].time; j++) {
                    uint256 distanceCurrent = (races[i].time - j) * j;

                    if (distanceCurrent > races[i].distance) {
                        waysToWin++;
                    }
                }

                result *= waysToWin;
            }
        } else {
            return 0;
        }
    }
}
