# TestToken (STT)

Implement the token so the tests in `test/TestToken.ts` pass. Do not change those tests or the contract name.

Full spec and timebox (60–90 minutes) are in the root [README](../README.md).

## Spec

| Field | Value |
| --- | --- |
| Name | `TestToken` |
| Symbol | `STT` |
| Decimals | `18` |
| Solidity | `^0.8.20` (Hardhat compiles `0.8.20`) |
| Initial supply | `1000 * 10**18` minted to the deployer |
| Access control | OpenZeppelin `Ownable` |

| Function | Behavior |
| --- | --- |
| `mint(address to, uint256 amount)` | Owner-only mint |
| `burn(uint256 amount)` | Caller burns from their own balance |
| `balanceOf(address account)` | Balance of `account` |

Use OpenZeppelin `ERC20`, `ERC20Burnable`, and `Ownable`. Start from `contracts/TestToken.sol`. The stub fails all 7 tests on purpose.

## Setup

```bash
cd contract
npm install
```

## Compile and test

```bash
npm run compile
npm test
```

## Local deploy (optional)

This starts a local Ethereum chain, not the Express API.

```bash
npm run chain
```

In another terminal:

```bash
npm run deploy:local
```

Copy the printed address into the backend `.env` as `CONTRACT_ADDRESS`. Use the same local wallet as `WALLET_PRIVATE` so `POST /mint` runs as the owner.

Sepolia (`npm run deploy:sepolia`) needs `PRIVATE_KEY` in `contract/.env` and is not part of the timed exercise.
