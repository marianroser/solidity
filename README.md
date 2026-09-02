# Skill Test: TestToken (60–90 minutes)

Implement a Solidity token so the provided Hardhat tests pass, then (if time) point the existing Node.js API at a local deploy.

**Do not rewrite the backend. Do not change the tests.** The tests are the spec.

---

## What is already in this repo

| Piece | Status |
| --- | --- |
| Express API (`/mint`, `/burn`, `/balance/:address`, `/health`) | Done — no code changes required |
| Hardhat project, compile/deploy scripts | Done |
| Contract tests in [`contract/test/TestToken.ts`](./contract/test/TestToken.ts) | Done — do not edit |
| [`contract/contracts/TestToken.sol`](./contract/contracts/TestToken.sol) | Stub — **this is your work** |

---

## Your task

### 1. Implement `TestToken` (required)

Work in [`contract`](./contract). Replace the stub in `contract/contracts/TestToken.sol`. Keep the contract name `TestToken`.

| Requirement | Value |
| --- | --- |
| Name | `TestToken` |
| Symbol | `STT` |
| Decimals | `18` |
| Solidity | `^0.8.20` |
| Access control | OpenZeppelin `Ownable` (deployer is owner) |
| Token standard | OpenZeppelin `ERC20` + `ERC20Burnable` |

| Function | Behavior |
| --- | --- |
| constructor | Mint **1000** tokens to the deployer (`1000 * 10**18`) |
| `mint(address to, uint256 amount)` | Owner only. Mints `amount` to `to`. |
| `burn(uint256 amount)` | Caller burns `amount` from their own balance. |
| `balanceOf(address account)` | Token balance of `account`. |
| `name()` / `symbol()` / `decimals()` / `owner()` | As in the table above. |

Amounts in the API are whole tokens. The contract uses 18 decimals, so 1 token is `1e18` base units. The backend already converts with `decimals()`.

```bash
cd contract
npm install
npm test
```

The stub fails all 7 tests on purpose. You are done with the required part when `npm test` is green.

### 2. Run the API against a local node (if time)

The backend is finished. After tests pass, you can deploy locally and call the HTTP endpoints.

Terminal 1:

```bash
cd contract
npm run node
```

Terminal 2:

```bash
cd contract
npm run deploy:local
```

Copy the printed address into the repo-root `.env` as `CONTRACT_ADDRESS`. Use the Hardhat account #0 key from [`.env.example`](./.env.example) (local network only).

```bash
npm install
cp .env.example .env
npm start
```

`GET http://localhost:4972/health` → `{ "status": "OK" }`

| Method | Path | Body / params |
| --- | --- | --- |
| `POST` | `/mint` | `{ "to": "0x…", "amount": 50 }` |
| `POST` | `/burn` | `{ "amount": 20 }` — burns from the backend wallet |
| `GET` | `/balance/:address` | — |

Sepolia is optional and **not required** for this exercise.

---

## How we evaluate

1. `contract` tests pass without edits to `test/TestToken.ts`.
2. `mint` is owner-only; `burn` spends the caller’s balance; initial supply is 1000 tokens to the deployer.
3. You used OpenZeppelin as specified, not a from-scratch ERC-20 unless you had a clear reason.

Spend your time on the contract. The backend is there so you can demo mint/burn/balance if you finish early.
