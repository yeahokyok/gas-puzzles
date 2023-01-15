// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.15;

contract OptimizedRequire {
    uint256 constant COOLDOWN = 1 minutes;

    // (Gsset) Setting a value from zero to a non-zero value cost 20k gas,
    // so set the value to 1 to make it a non-zero value.
    // non-zero to non-zero costs 5000(cold: Gcoldsload 2100 + Gsreset 2900)
    // (Gcoldsload) cold storage access cost 2100 gas
    // in this case `lastPurchaseTime` has already been accessed in the `require`
    // so it cost 2900 gas to set non-zero to non-zero
    uint256 lastPurchaseTime = 1;

    function purchaseToken() external payable {
        // split 2 requires
        require(msg.value == 0.1 ether, 'cannot purchase');
        require(
            block.timestamp > lastPurchaseTime + COOLDOWN,
            'cannot purchase'
        );
        lastPurchaseTime = block.timestamp;
        // mint the user a token
    }
}

// uint256 lastPurchaseTime = 1;
// Gas target
//        Current gas use:   26292
//        The gas target is: 43317

// split 2 requires
// Gas target
//        Current gas use:   26284
//        The gas target is: 43317
