// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {console2} from "forge-std/Test.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";
import {Arrays} from "@openzeppelin/contracts/utils/Arrays.sol";
import {BytesLib} from "solidity-bytes-utils/BytesLib.sol";

contract Day01_01 {
    bytes constant DIGITS = "\x30\x31\x32\x33\x34\x35\x36\x37\x38\x39";

    function parseLine(string memory line) public view virtual returns (uint256) {
        bytes memory lineBytes = bytes(line);
        uint8 firstDigit;
        bool firstDigitSet;
        uint8 lastDigit;

        for (uint256 index; index < lineBytes.length; index++) {
            for (uint256 index_digits; index_digits < DIGITS.length; index_digits++) {
                if (DIGITS[index_digits] == lineBytes[index]) {
                    if (!firstDigitSet) {
                        firstDigit = uint8(bytes1(lineBytes[index])) - 48;
                        firstDigitSet = true;
                    }

                    lastDigit = uint8(bytes1(lineBytes[index])) - 48;
                    break;
                }
            }
        }

        return firstDigit * 10 + lastDigit;
    }
}
