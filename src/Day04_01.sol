// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {LibString} from "solady/src/utils/LibString.sol";

contract Day04_01 {
    uint8 constant MAXIMUM_ALLOWED_RED = 12;
    uint8 constant MAXIMUM_ALLOWED_GREEN = 13;
    uint8 constant MAXIMUM_ALLOWED_BLUE = 14;

    function parseLine(string calldata line) public view virtual returns (uint256) {
        uint256 indexOfColon = LibString.indexOf(line, ":", 6);
        uint256 indexOfVerticalBar = LibString.indexOf(line, "|", 6);
        bytes calldata winningNumbers = bytes(line[indexOfColon + 2:indexOfVerticalBar]);
        bytes calldata pickedNumbers = bytes(line[indexOfVerticalBar + 2:]);

        uint256 matchingCount = 0;
        for (uint256 i = 0; i < winningNumbers.length; i += 3) {
            string calldata winningNumber = string(winningNumbers[i:i + 2]);

            for (uint256 j = 0; j < pickedNumbers.length; j += 3) {
                string calldata pickedNumber = string(pickedNumbers[j:j + 2]);

                if (LibString.eq(winningNumber, pickedNumber)) {
                    matchingCount++;
                }
            }
        }

        return matchingCount > 0 ? 2 ** (matchingCount - 1) : 0;
    }
}
