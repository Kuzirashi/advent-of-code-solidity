// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Day01_01 {
    bytes constant DIGITS = "\x30\x31\x32\x33\x34\x35\x36\x37\x38\x39";
    uint8 constant DIGITS_LENGTH = 10;

    function parseLine(string memory line) public view virtual returns (uint256) {
        bytes memory lineBytes = bytes(line);
        uint8 firstDigit;
        bool firstDigitSet;
        uint8 lastDigit;

        for (uint256 index; index < lineBytes.length; index++) {
            for (uint256 index_digits; index_digits < DIGITS_LENGTH; index_digits++) {
                if (DIGITS[index_digits] == lineBytes[index]) {
                    uint8 digit = uint8(bytes1(lineBytes[index])) - 48;
                    if (!firstDigitSet) {
                        firstDigit = digit;
                        firstDigitSet = true;
                    }

                    lastDigit = digit;
                    break;
                }
            }
        }

        return firstDigit * 10 + lastDigit;
    }
}
