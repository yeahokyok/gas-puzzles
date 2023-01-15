# [RareSkills](https://rareskills.io) Gas Puzzles

A sequence of smart contracts to practice gas optimization. These are used as practice assignments for RareSkills.io and the Udemy Gas Optimization Course

## Optimized Puzzles

-   Optimized [Vote](https://github.com/yeahokyok/gas-puzzles/blob/main/contracts/contracts_optimized/OptimizedVote.sol) 138807 to 136499 in gas usage.

-   Optimized [ArraySum](https://github.com/yeahokyok/gas-puzzles/blob/main/contracts/contracts_optimized/OptimizedArraySum.sol) 23399 to 23396 in gas usage.

-   Optimized [Require](https://github.com/yeahokyok/gas-puzzles/blob/main/contracts/contracts_optimized/OptimizedRequire.sol) 43392 to 26284 in gas usage.

-   Optimized [Distribute](https://github.com/yeahokyok/gas-puzzles/blob/main/contracts/contracts_optimized/OptimizedDistribute.sol) 71953 to 57022 in gas usage.

## file structure

```
- GasPuzzles
  |_
    contracts
    |_
      contracts_optimized
    | |_
    |   OptimizedArraySum.sol
    |   OptimizedDistribute.sol
    |   ..
    |   ...
    |
    ArraySum.sol
    Distribute.sol
    ..
    ...
```

## Testing

```
yarn hardhat test
yarn hardhat test test/Vote
```
