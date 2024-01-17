// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {LibBytesUint} from "./LibBytesUint.sol";

contract Day01_01 {
    function parseLine(string memory line) public view virtual returns (uint256) {
        bytes memory lineBytes = bytes(line);
        uint256 firstDigit;
        bool firstDigitSet;
        uint256 lastDigit;

        for (uint256 i; i < lineBytes.length; i++) {
            if (LibBytesUint.isDigit(lineBytes[i])) {
                uint256 digit = uint256(uint8(bytes1(lineBytes[i]))) - 48;
                if (!firstDigitSet) {
                    firstDigit = digit;
                    firstDigitSet = true;
                }

                lastDigit = digit;
            }
        }

        return firstDigit * 10 + lastDigit;
    }
}
