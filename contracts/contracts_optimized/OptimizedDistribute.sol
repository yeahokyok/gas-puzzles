// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.15;

contract OptimizedDistribute {
    // contributors and createTime are never modified after the contract's construction,
    // making them immutable will embed them in the contract bytecode
    // as constants instead of reading from storage.
    address payable immutable contributor1;
    address payable immutable contributor2;
    address payable immutable contributor3;
    address payable immutable contributor4;

    // do the time calculations in constructor
    uint256 public immutable distributionTime;

    constructor(address payable[4] memory _contributors) payable {
        contributor1 = _contributors[0];
        contributor2 = _contributors[1];
        contributor3 = _contributors[2];
        contributor4 = _contributors[3];
        distributionTime = block.timestamp + 1 weeks;
    }

    function distribute() external {
        require(block.timestamp > distributionTime, 'cannot distribute yet');

        uint256 amount = address(this).balance / 4;
        // Replace transfer with send and selfdestruct
        contributor1.send(amount);
        contributor2.send(amount);
        contributor3.send(amount);
        selfdestruct(contributor4);
    }
}

// Gas target
//        Unoptimized gas use:  71953
//        The gas target is:    57044
//        Current gas use:      57022
