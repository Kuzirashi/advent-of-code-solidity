// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {LibString} from "solady/src/utils/LibString.sol";
import {LibBytesUint} from "./LibBytesUint.sol";

struct Point {
    uint256 x;
    uint256 y;
}

struct Rectangle {
    Point start;
    Point end;
    uint256 value;
    bool valueSet;
}

function intersects(Rectangle memory a, Rectangle memory b) pure returns (bool) {
    if (a.start.x > b.end.x || b.start.x > a.end.x) {
        return false;
    }

    if (a.end.y < b.start.y || b.end.y < a.start.y) {
        return false;
    }

    return true;
}

contract Day03_02 {
    Rectangle[] numberRectangles;
    Rectangle[] symbolImpactAreas;

    uint256 lineIndex;

    bytes1 constant CHAR_ASTERISK = 0x2a;
    bytes1 constant CHAR_DOT = 0x2e;
    uint256 constant ASTERISK_VALUE_INDICATOR = 7777777777777777;

    function parseLine(string calldata line) public virtual {
        bytes memory lineBytes = bytes(line);
        uint256 numberVectorLength;
        uint256 totalNumber;

        for (uint256 i; i < lineBytes.length; i++) {
            bool isDigit = LibBytesUint.isDigit(lineBytes[i]);
            if (isDigit) {
                uint256 digit = uint256(uint8(bytes1(lineBytes[i]))) - 48;
                totalNumber = totalNumber * 10 + digit;
                numberVectorLength++;
            }

            if (totalNumber != 0 && (!isDigit || i == lineBytes.length - 1)) {
                numberRectangles.push(
                    Rectangle({
                        start: Point(i - numberVectorLength, lineIndex),
                        end: Point(i - 1, lineIndex),
                        value: totalNumber,
                        valueSet: true
                    })
                );
                delete numberVectorLength;
                delete totalNumber;
            }

            if (lineBytes[i] != CHAR_DOT && !isDigit) {
                symbolImpactAreas.push(
                    Rectangle({
                        start: Point(i == 0 ? 0 : i - 1, lineIndex == 0 ? 0 : lineIndex - 1),
                        end: Point(i + 1, lineIndex + 1),
                        value: lineBytes[i] == CHAR_ASTERISK ? ASTERISK_VALUE_INDICATOR : 0,
                        valueSet: false
                    })
                );
            }
        }

        lineIndex++;
    }

    function computeResult() public view returns (uint256) {
        uint256 result;

        for (uint256 j; j < symbolImpactAreas.length; j++) {
            if (symbolImpactAreas[j].value != ASTERISK_VALUE_INDICATOR) {
                continue;
            }

            uint256 intersections_value = 1;
            uint256 intersections_count = 0;
            for (uint256 i; i < numberRectangles.length; i++) {
                if (intersects(numberRectangles[i], symbolImpactAreas[j])) {
                    intersections_value *= numberRectangles[i].value;
                    intersections_count++;

                    if (intersections_count == 2) {
                        result += intersections_value;
                        break;
                    }
                }
            }
        }

        return result;
    }
}
