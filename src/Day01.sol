// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {console2} from "forge-std/Test.sol";

contract Day01 {
    uint256 public number;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function parseLine(string memory line) public {
        bytes memory line_bytes = bytes(line);
        uint first_digit;
        uint last_digit;

        // console2.log(string(abi.encodePacked(line_bytes[0])));
        

        for (uint index; index < line_bytes.length; index++) {
            string memory char = string(abi.encodePacked(line_bytes[index]));
        }
    }
}
