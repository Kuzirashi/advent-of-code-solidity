// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

library LibBytesUint {
    function bytesToUint(bytes memory b) public pure returns (uint256) {
        uint256 result = 0;
        for (uint256 i = 0; i < b.length; i++) {
            uint256 c = uint256(uint8(b[i]));
            if (c >= 48 && c <= 57) {
                result = result * 10 + (c - 48);
            }
        }
        return result;
    }
}
