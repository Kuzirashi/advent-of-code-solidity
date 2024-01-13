// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {console2} from "forge-std/Test.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";
import {Arrays} from "@openzeppelin/contracts/utils/Arrays.sol";
import {BytesLib} from "solidity-bytes-utils/BytesLib.sol";

contract Day01_01 {
    bytes constant DIGITS = "\x30\x31\x32\x33\x34\x35\x36\x37\x38\x39";

    function parseLine(string memory line) public pure returns (uint256) {
        bytes memory line_bytes = bytes(line);
        uint8 first_digit;
        bool first_digit_set;
        uint8 last_digit;

        for (uint256 index; index < line_bytes.length; index++) {
            for (uint256 index_digits; index_digits < DIGITS.length; index_digits++) {
                if (DIGITS[index_digits] == line_bytes[index]) {
                    if (!first_digit_set) {
                        first_digit = uint8(bytes1(line_bytes[index])) - 48;
                        first_digit_set = true;
                    }

                    last_digit = uint8(bytes1(line_bytes[index])) - 48;
                    break;
                }
            }
        }

        return first_digit * 10 + last_digit;
    }
}
