
# Apex-Plug-ins
Novocoin is a modular project that bridges blockchain technology with enterprise applications. It consists of three main components: Novocoin.contract, an extended ERC-20 smart contract with support for ETH-based token purchases, minting/burning controls, and ownership management; Novocoin.plugin.apex, a custom Oracle APEX plugin that displays users’ token balances in real time via Web3 and MetaMask; and Novocoin.send.eth, a lightweight web interface for sending ETH to the contract and purchasing tokens directly from the browser. Together, these components deliver a seamless Web3 experience within modern enterprise environments.

# Novoshore
<p align="center">
  <a href="https://www.novoshore.com/" target="blank"><img src="https://www.novoshore.com/wp-content/uploads/2018/08/n-ugly-3-e1534939287262.png" width="315" alt="Novoshore Logo" /></a>
</p>
<p align="center">Oracle Apex files for Apex projects.</p>

## Folder Structure

### `Novocoin.contract` Folder
Implements the ERC-20 token standard with extended functionalities such as ETH-based token purchases, administrative minting/burning, and ownership control. This smart contract serves as the core logic layer for token economics and governance.

### `Novocoin.plugin.apex` Folder
A custom Oracle APEX plugin that connects to the blockchain via Web3 and MetaMask, allowing real-time display of a user’s Novocoin token balance. It supports enterprise environments by providing seamless, secure blockchain integration directly in APEX pages.

### `Novocoin.send.eth` Folder
A frontend utility that facilitates sending ETH to the smart contract, enabling token purchases directly from the browser. It acts as a lightweight gateway between the user’s wallet and the Novocoin contract.

## 📚 Documentation

This project relies on multiple technologies from blockchain development to Oracle APEX. The following resources provide reference and guidance for working with each layer:

### 🔗 Oracle APEX
- [Oracle APEX JavaScript API Reference (Release 24.2)](https://docs.oracle.com/en/database/oracle/apex/24.2/aexjs/index.html) – Client-side interactions with APEX components.
- [PL/SQL API Documentation (Release 24.2)](https://docs.oracle.com/en/database/oracle/apex/24.2/aeapi/toc.htm) – Backend server-side logic for plugin and region handling.
- [APEX Plugin Development Guide](https://docs.oracle.com/en/database/oracle/apex/22.1/htmdb/implementing-plug-ins.html) – Plugin interface design and integration guide.
- [Universal Theme Guide](https://apex.oracle.com/ut/) – Standardized UI practices for APEX apps.

### 🔗 Smart Contract Development & Web3
- [Solidity Docs](https://docs.soliditylang.org/) – Main programming language for the smart contract layer.
- [Web3.js](https://web3js.readthedocs.io/) – Blockchain interaction library used in the APEX plugin.
- [Ethers.js](https://docs.ethers.org/v6/) – Alternative lightweight library for Web3 interaction.
- [OpenZeppelin Contracts](https://docs.openzeppelin.com/contracts/) – Secure ERC-20 base contract implementation.

### 🔗 Development Tools
- [Truffle](https://archive.trufflesuite.com/docs/truffle/) – Compilation, deployment, and migration framework.
- [Hardhat](https://hardhat.org/docs) – Flexible smart contract development environment.
- [Remix IDE](https://remix.ethereum.org/) – Web-based IDE for Solidity testing.
- [Ganache](https://trufflesuite.com/ganache/) – Local test blockchain for development and testing.

### 🔗 Deployment & Infra
- [MetaMask](https://docs.metamask.io/) – Wallet integration for signing transactions and reading balances.
- [Infura](https://docs.infura.io/) – Ethereum node API provider for remote deployment.
- [Alchemy](https://docs.alchemy.com/) – Reliable alternative to Infura for production.
- [Chainlist](https://chainlist.org/) – Public RPC endpoints for various EVM-compatible networks.

---

## 🛠 Tools Used

- **Node.js** – JavaScript runtime for build tools and Web3 libraries.
- **Truffle** – Primary framework for compiling and deploying smart contracts.
- **Ganache** – Simulated Ethereum blockchain for local testing.
- **MetaMask** – User wallet extension for blockchain interaction.
- **Oracle APEX** – UI platform used to deliver the Web3 plugin experience.
- **Web3.js** – Enables the APEX plugin to communicate with the blockchain.

---

## ⚙️ Prerequisites

Make sure you have the following tools installed:

| Tool            | Description                                                        |
|-----------------|--------------------------------------------------------------------|
| Node.js         | Required to run CLI and JavaScript build tools.                    |
| Truffle         | For compiling, deploying, and testing contracts.                   |
| Ganache         | For simulating a local Ethereum network.                           |
| MetaMask        | For connecting and signing blockchain transactions.                |
| Oracle APEX     | Required to deploy and use the plugin.                             |

Optional tools:
- **Hardhat** – Flexible smart contract development framework.
- **Remix** – Ideal for quick Solidity code tests.
- **Infura/Alchemy** – RPC providers for public blockchain deployment.

---

## 🚀 Installation Instructions

Follow these steps to install and configure Novocoin locally:

1. **Install Node.js**  
   [Download Node.js](https://nodejs.org/) (version 14 or later).

2. **Install Truffle**
   ```bash
   npm install -g truffle
   ```

3. **(Optional) Install Ganache**
   ```bash
   npm install -g ganache
   ```

4. **Install MetaMask**
   Install the extension from [metamask.io](https://metamask.io/), and create/import a wallet.

5. **Clone the Repository**
   ```bash
   git clone https://github.com/your-org/novocoin.git
   cd novocoin
   ```

6. **Install Dependencies**  
   Run this inside both `Novocoin.contract` and `Novocoin.send.eth`:
   ```bash
   npm install
   ```

7. **Compile and Deploy Contracts**
   In `Novocoin.contract`:
   ```bash
   truffle compile
   truffle migrate --network development
   ```

8. **Deploy APEX Plugin**
   - Import the plugin into Oracle APEX.
   - Set the smart contract address and user wallet address as plugin attributes.
   - Make sure MetaMask is enabled when viewing the APEX page.
   
## 📄 License

MIT License. See [LICENSE](../LICENSE) for details.

---

Built with ❤️ by [Novoshore Europe](https://novoshore.com).