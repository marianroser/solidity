// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title TestToken
 * @notice Implement this ERC-style token according to the project requirements.
 *
 * Required:
 * - Name: TestToken
 * - Symbol: STT
 * - Mint 1000 tokens to the deployer in the constructor
 * - mint(address to, uint256 amount) — owner only
 * - burn(uint256 amount) — caller burns from their own balance
 * - balanceOf(address account) — returns the token balance
 *
 * Use OpenZeppelin Ownable for owner-based access control.
 */
contract TestToken {
    constructor() {}
}
