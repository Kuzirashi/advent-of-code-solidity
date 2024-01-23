// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {LibString} from "solady/src/utils/LibString.sol";

struct Card {
    uint256 duplicates;
    uint256 cardsWon;
}

contract Day04_02 {
    uint256 lineIndex;
    Card[] cards;

    function parseLine(string calldata line) public {
        uint256 indexOfColon = LibString.indexOf(line, ":", 6);
        uint256 indexOfVerticalBar = LibString.indexOf(line, "|", 6);
        bytes calldata winningNumbers = bytes(line[indexOfColon + 2:indexOfVerticalBar]);
        bytes calldata pickedNumbers = bytes(line[indexOfVerticalBar + 2:]);

        uint256 cardsWon = 0;
        for (uint256 i = 0; i < winningNumbers.length; i += 3) {
            string calldata winningNumber = string(winningNumbers[i:i + 2]);

            for (uint256 j = 0; j < pickedNumbers.length; j += 3) {
                string calldata pickedNumber = string(pickedNumbers[j:j + 2]);

                if (LibString.eq(winningNumber, pickedNumber)) {
                    cardsWon++;
                }
            }
        }

        cards.push(Card(0, cardsWon));

        lineIndex++;
    }

    function computeResult() public returns (uint256 result) {
        for (uint256 i = 0; i < cards.length; i++) {
            Card memory card = cards[i];
            uint256 totalInstances = 1 + card.duplicates;

            for (uint256 j = 0; j < card.cardsWon; j++) {
                cards[i + j + 1].duplicates += totalInstances;
            }

            result += totalInstances;
        }

        return result;
    }
}
