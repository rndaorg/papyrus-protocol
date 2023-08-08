// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./PaperRegistry.sol";

contract AuthorRewards {

    PaperRegistry public registry;

    mapping(address => uint256) public authorRewards;

    function distributeRewards(address author, uint256 _paperId) external {
        // Calculate rewards based on predefined rules and review feedback
        
        //TO DO
        //address author =  registry.papers[_paperId].owner; // Get the author's address for the given paperId;
        uint256 rewards = authorRewards[author]; // Calculate rewards for the author;

        authorRewards[author] += rewards;
    }

    // Add functions for querying author rewards and other reward-related logic here
}
