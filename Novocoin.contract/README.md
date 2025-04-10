
# 🌟 Novocoin Smart Contract – User Guide & Feature Overview

## 📜 Introduction

**Novocoin** is a smart contract based on the **ERC20** standard, enhanced with advanced capabilities such as minting, burning, token purchases using ETH, and robust administrative controls. This guide provides a comprehensive overview of how the contract works, its features, and how to interact with it.

---

## 🪙 Token Specifications

- **Name**: Novocoin  
- **Symbol**: NOV  
- **Decimals**: 2 (Token values are expressed with two decimal places)  
- **Initial Supply**: 1,000,000 tokens  
- **Maximum Supply**: 2,000,000 tokens  
- **Token Price**: 1000 wei (1 ETH = 1000 tokens)  

---

## ⚙️ Core Features

### ✅ Standard ERC20 Functions

The contract implements all essential ERC20 functions:

- `totalSupply()`: Returns the total circulating supply.  
- `balanceOf(address)`: Returns the token balance of a specific address.  
- `transfer(address, uint)`: Transfers tokens from the caller to another address.  
- `approve(address, uint)`: Approves another address to spend tokens on the caller’s behalf.  
- `allowance(address, address)`: Returns the remaining allowance a spender has.  
- `transferFrom(address, address, uint)`: Transfers tokens on behalf of another address.

### 👑 Administrative Controls

- **Owner**:
  - The contract deployer becomes the initial owner.
  - Ownership can be transferred using `transferOwnership(address)`.
  - The owner can assign or revoke admin rights with `setAdministrator(address, bool)`.

- **Administrators**:
  - Can mint new tokens up to the defined maximum supply via `mint(uint)`.
  - Can update the token price with `updateTokenPrice(uint)`.
  - Can pause or resume token purchases using `pausePurchases(bool)`.

### 💰 Token Purchases

- Users can acquire tokens by sending ETH to the contract.  
- The `buyTokens()` function calculates the number of tokens based on the current token price and returns any excess ETH.

### 🔥 Minting & Burning

- **Minting**:  
  Only administrators can mint new tokens, respecting the maximum supply limit of 2,000,000.

- **Burning**:  
  Any user can burn their own tokens with `burn(uint)`.

### 💸 Withdrawals

The owner can withdraw ETH from the contract using `withdrawEther(uint)`.

### ⏸️ Purchase Pausing

Token purchases can be temporarily paused and resumed by administrators.

---

## 📢 Events

The contract emits events to track important operations:

- `Transfer(from, to, tokens)`: Emitted on token transfers.  
- `Approval(owner, spender, tokens)`: Emitted on allowance approvals.  
- `TokensPurchased(buyer, tokens, ethSpent)`: Emitted when tokens are bought with ETH.  
- `TokenPriceUpdated(oldPrice, newPrice)`: Emitted when the token price is updated.  
- `OwnershipTransferred(oldOwner, newOwner)`: Emitted on ownership transfer.

---

## 🛡️ Modifiers for Access Control

- `onlyOwner`: Restricts a function to the contract owner.  
- `onlyAdmin`: Restricts access to admin-only functions.  
- `whenNotPaused`: Ensures that purchases can only proceed when enabled.

---

## 🧪 Available Functions

### 🔓 Public

#### ERC20 Functions
- `totalSupply()`
- `balanceOf(address)`
- `transfer(address, uint)`
- `approve(address, uint)`
- `allowance(address, address)`
- `transferFrom(address, address, uint)`

#### Token Purchase
- `buyTokens()`: Purchase tokens with ETH.

#### Minting & Burning
- `mint(uint)`: Admins can mint new tokens.  
- `burn(uint)`: Users can burn their own tokens.

#### Administrative
- `setAdministrator(address, bool)`
- `transferOwnership(address)`
- `updateTokenPrice(uint)`
- `pausePurchases(bool)`

#### Utility
- `availableForSale()`: Tokens available for sale (held by owner).  
- `contractBalance()`: ETH balance held by the contract.

#### Withdrawals
- `withdrawEther(uint)`: Allows the owner to withdraw ETH.

---

## 🚀 Deployment & Usage

### Deployment

1. Deploy the contract to any Ethereum-compatible network (e.g., mainnet or testnet).  
2. The deployer becomes the owner and receives the initial 1 million NOV tokens.

### Interacting with the Contract

- Use development tools like **Remix**, **Hardhat**, or **Truffle**.  
- Use wallets like **MetaMask** to send ETH and interact with the contract.  
- ETH sent directly to the contract address will trigger token purchases if not paused.

---

## 🧰 Required Tooling

To develop or test the contract, ensure the following tools are available:

- **Node.js (v14 or higher)**  
- **Truffle Framework** – for compilation, deployment, and testing  
- **Ganache** – local blockchain for development  
- **MetaMask** – for managing wallets and network interactions

---

## 🔒 Security Considerations

- Assign administrator rights only to trusted addresses.  
- Monitor token price regularly and adjust as needed.  
- Be cautious with ownership transfers and large ETH withdrawals.

---

> **Novocoin** is more than a token—it’s a living contract, designed with intention, governed by clarity, and built to evolve.  
> Like all worthy agreements, it doesn’t just execute—it honors.
