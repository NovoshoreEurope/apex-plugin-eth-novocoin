# Novocoin - ERC20 Token

Novocoin is an ERC20-compatible token built on Ethereum. This project demonstrates how to create a simple token contract with features such as transferring tokens, setting administrators, and assigning tokens via administrative privileges.

## Features

- **ERC20 Compliance**: Implements the standard ERC20 token functions.
- **Administrator Management**: The owner can set or revoke administrator status, which allows them to assign tokens.
- **SafeMath**: Uses the `SafeMath` library to prevent overflow and underflow in arithmetic operations.
- **Approve and Call**: Allows a contract to be notified of a token approval event, with additional data.
- **Total Supply**: The total token supply is initially assigned to the contract owner.

## Installation

### Prerequisites

Before using or deploying the contract, ensure you have the following installed:

- [Node.js](https://nodejs.org/) (v14 or later)
- [Truffle Framework](https://www.trufflesuite.com/truffle)
- [Ganache](https://www.trufflesuite.com/ganache) (for local blockchain development)
- [MetaMask](https://metamask.io/) (for wallet management and testnet interaction)

### Setting up the Project

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yourusername/novocoin.git
   cd novocoin
