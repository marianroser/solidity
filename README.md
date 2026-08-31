# Skill Test: Smart Contract Development and Backend Integration

This exercise evaluates your ability to:

1. Develop a simple token contract in Solidity.
2. Deploy that contract to a public Ethereum testnet.
3. Connect a Node.js backend to the deployed contract with **ethers.js** or **web3.js**.

The backend in this repository is already implemented. Your job is to write and deploy the contract, then point the backend at it with a valid `.env` file.

---

## Part 1: Smart Contract Development

Work in the [`contract`](./contract) folder. Full setup and deploy steps are in [`contract/README.md`](./contract/README.md).

### Requirements

1. **Create a token contract**
   - **Token name:** `TestToken`
   - **Token symbol:** `STT`
   - **Initial supply:** mint `1000` tokens to the contract deployer
   - Implement:
     - `mint(address to, uint256 amount)` — only the owner can mint
     - `burn(uint256 amount)` — users burn tokens from their own balance
     - `balanceOf(address account)` — returns the token balance of an address

2. **Technical details**
   - Solidity `^0.8.0`
   - OpenZeppelin **Ownable** for owner-based access control
   - Deploy to a public testnet such as **Sepolia**

Token amounts used by the API are whole tokens. If you use decimals (18 is recommended with OpenZeppelin ERC20), implement `decimals()` and mint the initial supply as `1000 * 10 ** decimals()`.

Start from `contract/contracts/TestToken.sol`. Keep the contract name `TestToken`.

---

## Part 2: Node.js Backend

The Express server is ready. After you deploy the contract, configure the backend and start it — no backend code changes are required.

### Setup

```bash
npm install
cp .env.example .env
```

Fill in `.env`:

| Variable | Description |
| --- | --- |
| `PORT` | HTTP port (default `4972`) |
| `RPC_PROVIDER_URL` | RPC URL for the testnet you deployed to |
| `CONTRACT_ADDRESS` | Address printed by the Hardhat deploy script |
| `WALLET_PRIVATE` | Private key of the **deployer / owner** wallet (used for `mint` and `burn`) |

```bash
npm start
```

The server listens on `http://localhost:4972`. `GET /health` should return `{ "status": "OK" }`.

### API endpoints

#### 1. Mint tokens

`POST /mint`

```json
{
  "to": "0xRecipientAddress",
  "amount": 50
}
```

```json
{
  "message": "Tokens minted successfully",
  "transactionHash": "0xTransactionHash"
}
```

#### 2. Burn tokens

`POST /burn`

Burns from the backend wallet configured in `.env`.

```json
{
  "amount": 20
}
```

```json
{
  "message": "Tokens burned successfully",
  "transactionHash": "0xTransactionHash"
}
```

#### 3. Get balance

`GET /balance/:address`

```json
{
  "balance": 100
}
```

---

## Suggested workflow

1. Implement `TestToken` in `contract/contracts/TestToken.sol`.
2. Install contract dependencies, set `contract/.env`, compile, and deploy to Sepolia.
3. Copy the deployed address into the backend `.env` as `CONTRACT_ADDRESS`.
4. Set `WALLET_PRIVATE` to the same key used to deploy, and `RPC_PROVIDER_URL` to a Sepolia RPC.
5. Run `npm start` and call `/mint`, `/burn`, and `/balance/:address`.
