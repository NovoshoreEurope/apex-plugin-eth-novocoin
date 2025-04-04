# Novocoin Smart Contract - README

## Overview
The **Novocoin** smart contract is an implementation of the ERC20 token standard with additional features such as minting, burning, token purchases with ETH, and administrative controls. Below is a detailed explanation of its functionality, features, and usage.

---

## Token Details
- **Name**: Novocoin  
- **Symbol**: NOV  
- **Decimals**: 2 (Token values are represented with two decimal places)  
- **Initial Supply**: 1,000,000 tokens  
- **Maximum Supply**: 2,000,000 tokens  
- **Token Price**: 1000 wei per token (1 ETH = 1000 tokens)  

---

## Key Features

### ERC20 Standard Functions
The contract implements the following standard ERC20 functions:
1. **`totalSupply()`**: Returns the total supply of tokens in circulation.
2. **`balanceOf(address)`**: Returns the balance of a specific address.
3. **`transfer(address, uint)`**: Transfers tokens from the caller to another address.
4. **`approve(address, uint)`**: Approves another address to spend a specified amount of tokens on behalf of the caller.
5. **`allowance(address, address)`**: Checks the remaining allowance for a spender on behalf of a token owner.
6. **`transferFrom(address, address, uint)`**: Transfers tokens on behalf of another address.

### Administrative Controls
- **Owner Role**:
  - The contract deployer is assigned as the owner.
  - The owner can transfer ownership to another address using `transferOwnership(address)`.
  - The owner can assign or revoke administrator roles using `setAdministrator(address, bool)`.
- **Administrator Role**:
  - Administrators can mint new tokens up to the maximum supply using `mint(uint)`.
  - Administrators can update the token price using `updateTokenPrice(uint)`.
  - Administrators can pause or resume token purchases using `pausePurchases(bool)`.

### Token Purchases
- Users can buy tokens by sending ETH to the contract.
- The function `buyTokens()` calculates the number of tokens based on ETH sent and the token price.
- Excess ETH sent (if any) is refunded to the user.

### Minting and Burning
- **Minting**:
  - Administrators can mint new tokens up to a cap of 2,000,000 tokens.
- **Burning**:
  - Any user can burn their own tokens using `burn(uint)`.

### Withdrawals
The owner can withdraw ETH from the contract balance using `withdrawEther(uint)`.

### Pause Functionality
Token purchases can be paused or resumed by administrators using `pausePurchases(bool)`.

---

## Events
The contract emits events for various actions:
1. **`Transfer(address indexed from, address indexed to, uint tokens)`**: Emitted during token transfers.
2. **`Approval(address indexed owner, address indexed spender, uint tokens)`**: Emitted when an approval is granted.
3. **`TokensPurchased(address indexed buyer, uint tokens, uint ethSpent)`**: Emitted when tokens are purchased with ETH.
4. **`TokenPriceUpdated(uint oldPrice, uint newPrice)`**: Emitted when the token price is updated.
5. **`OwnershipTransferred(address indexed oldOwner, address indexed newOwner)`**: Emitted when ownership is transferred.

---

## Modifiers
The following modifiers are used to enforce access control and conditions:
1. **`onlyOwner`**: Restricts certain functions to the contract owner.
2. **`onlyAdmin`**: Restricts certain functions to administrators.
3. **`whenNotPaused`**: Ensures that certain functions can only be executed when purchases are not paused.

---

## Functions Overview

### Public Functions
1. **ERC20 Functions**
   - `totalSupply()`: Returns total circulating supply.
   - `balanceOf(address)`: Returns balance of an address.
   - `transfer(address, uint)`: Transfers tokens from caller to another address.
   - `approve(address, uint)`: Approves another address for spending on behalf of caller.
   - `allowance(address, address)`: Checks allowance for a spender.
   - `transferFrom(address, address, uint)`: Transfers tokens on behalf of another user.

2. **Token Purchase**
   - `buyTokens()`: Allows users to purchase tokens by sending ETH.

3. **Minting and Burning**
   - `mint(uint)`: Allows administrators to mint new tokens (up to max supply).
   - `burn(uint)`: Allows users to burn their own tokens.

4. **Administrative Functions**
   - `setAdministrator(address, bool)`: Assigns or revokes administrator roles.
   - `transferOwnership(address)`: Transfers ownership to another address.
   - `updateTokenPrice(uint)`: Updates the price of tokens in wei.
   - `pausePurchases(bool)`: Pauses or resumes token purchases.

5. **Utility Functions**
   - `availableForSale()`: Returns the number of tokens available for sale (held by owner).
   - `contractBalance()`: Returns the ETH balance held by the contract.

6. **Withdrawals**
   - `withdrawEther(uint)`: Allows the owner to withdraw ETH from the contract balance.

---

## Deployment and Usage Instructions

### Deployment
1. Deploy the contract on an Ethereum-compatible blockchain (e.g., Ethereum mainnet or testnet).
2. The deployer will automatically become the owner and receive the initial supply of 1 million NOV tokens.

### Interacting with the Contract
- Use any Ethereum wallet or development tool like Remix or Hardhat to interact with the contract functions.
- Send ETH directly to the contract address to purchase NOV tokens (if purchases are not paused).

---

## Tools Used

To develop and interact with this smart contract locally or on testnets/mainnets, you will need:

1. **Node.js (v14 or later)**  
   Ensure Node.js is installed for running development tools like Truffle and Ganache.

2. **Truffle Framework**  
   Truffle provides a suite of tools for compiling contracts, deploying them on blockchains, and testing their functionality.

3. **Ganache**  
   Ganache is used as a local blockchain environment for testing smart contracts during development.

4. **MetaMask Wallet**  
   MetaMask allows you to manage wallets and interact with deployed contracts on various Ethereum networks (mainnet/testnet).

---

## Security Considerations
1. Ensure only trusted addresses are assigned as administrators.
2. Regularly monitor and update token prices as needed via `updateTokenPrice`.
3. Use caution when transferring ownership or withdrawing large amounts of ETH from the contract.

---

This README provides a comprehensive guide to understanding and interacting with the Novocoin smart contract!