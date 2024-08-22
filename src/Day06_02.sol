// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {LibString} from "solady/src/utils/LibString.sol";
import {LibBytesUint} from "./LibBytesUint.sol";

contract Day06_02 {
    uint256 lineIndex;

    uint256 distance;
    uint256 time;

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

    function collectSeparatedEntries(string[] memory splitByWhitespace) internal pure returns (uint256) {
        string memory collectedString = splitByWhitespace[1];
        for (uint256 i = 2; i < splitByWhitespace.length; i++) {
            collectedString = string.concat(collectedString, splitByWhitespace[i]);
        }

        return LibBytesUint.bytesToUint(bytes(collectedString));
    }

    function parseLine(string calldata line) public virtual returns (uint256 result) {
        string[] memory splitByWhitespace = splitWhitespace(line);

        if (lineIndex == 0) {
            time = collectSeparatedEntries(splitByWhitespace);
        } else {
            distance = collectSeparatedEntries(splitByWhitespace);
        }

        lineIndex++;

        if (lineIndex == 2) {
            for (uint256 i = 0; i < time; i++) {
                uint256 distanceCurrent = (time - i) * i;

                if (distanceCurrent > distance) {
                    result++;
                }
            }
        } else {
            return 0;
        }
    }
}