// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.15;

contract OptimizedArraySum {
    uint256[] array;

    function setArray(uint256[] memory _array) external {
        require(_array.length <= 10, 'too long');
        array = _array;
    }

    function getArraySum() external view returns (uint256 sum) {
        // Remove uint256 sum and return
        // Storing the array length in memory costs more gas than directly accessing array.length
        for (uint256 i = 0; i < array.length; i++) {
            sum += array[i];
        }
    }
}
// Gas target
//    Current gas use:   23391
//    The gas target is: 23396
