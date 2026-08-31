# TestToken (STT) Smart Contract

Implement and deploy the token described in the root [README](../README.md).

## Requirements

- **Name:** `TestToken`
- **Symbol:** `STT`
- **Initial supply:** mint `1000` tokens to the deployer
- **Solidity:** `^0.8.0`
- **Access control:** OpenZeppelin `Ownable`

### Functions

| Function | Description |
| --- | --- |
| `mint(address to, uint256 amount)` | Owner-only. Mints tokens to `to`. |
| `burn(uint256 amount)` | Caller burns tokens from their own balance. |
| `balanceOf(address account)` | Returns the token balance of `account`. |

Start from `contracts/TestToken.sol`. Do not change the contract name — the deploy script and backend ABI expect `TestToken`.

## Setup

```bash
cd contract
npm install
cp .env.example .env
```

Set `PRIVATE_KEY` to a wallet funded with testnet ETH. Optionally set `RPC_URL` and `ETHERSCAN_API_KEY`.

## Compile and deploy

```bash
npm run compile
npm run deploy:sepolia
```

After a successful deploy, copy the printed contract address into the backend `.env` as `CONTRACT_ADDRESS`. Use the same wallet private key in the backend so `mint` can run as the owner.
