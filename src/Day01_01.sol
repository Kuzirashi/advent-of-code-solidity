// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {LibBytesUint} from "./LibBytesUint.sol";

contract Day01_01 {
    function parseLine(string memory line) public view virtual returns (uint256) {
        bytes memory lineBytes = bytes(line);
        uint8 firstDigit;
        bool firstDigitSet;
        uint8 lastDigit;

        for (uint256 index; index < lineBytes.length; index++) {
            if (LibBytesUint.isDigit(lineBytes[index])) {
                uint8 digit = uint8(bytes1(lineBytes[index])) - 48;
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
