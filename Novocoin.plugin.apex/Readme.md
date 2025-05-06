# Novocoin APEX Plugin (Ethereum Sepolia)

Oracle APEX plugin to retrieve and display the Novocoin token balance for a given Ethereum address using the Sepolia testnet.

## 🧩 About This Plugin

This plugin is designed for developers working with Oracle APEX who want to integrate blockchain functionality—specifically, querying ERC-20 token balances from the Ethereum network—into their applications.

We created this plugin to simplify working with smart contracts, ABI files, and RPC nodes from within a traditional enterprise development environment like Oracle APEX.

> In our [previous article](https://github.com/NovoshoreEurope/...) (TODO: Add actual link), we demonstrated how to integrate Oracle Blockchain with APEX using the Novocoin concept. In this version, we take it one step further by adapting the same structure to work with Ethereum (Sepolia) and making it available as a reusable plugin.

## 🔧 How It Works

The plugin connects to the Ethereum Sepolia testnet and interacts with the Novocoin smart contract to retrieve the token balance for the address provided by the user.

- ✅ Queries ERC-20 token balances from the blockchain
- ✅ Displays balance inside an Oracle APEX region
- ✅ Built for the Sepolia testnet
- ✅ Uses JSON-RPC to communicate with an Ethereum node
- ✅ Fully encapsulated for easy APEX integration

## 📷 Screenshot

![Novocoin APEX plugin with MetaMask wallet](https://github.com/NovoshoreEurope/apex-plugin-eth-novocoin/assets/your-image-id.png)

*The Oracle APEX plugin displays the Novocoin balance for the connected wallet, matching the user's MetaMask balance.*

## 🚀 Quick Start

1. **Download and import the plugin** into your Oracle APEX app.
2. **Provide your Ethereum wallet address** in the plugin settings.
3. **Configure the plugin attributes**, including:
   - Ethereum RPC endpoint (e.g., https://sepolia.infura.io/v3/your-key)
   - Novocoin contract address
   - ABI (included in the plugin)

## 🔐 Prerequisites

- Oracle APEX 22.1 or higher
- Access to an Ethereum RPC node (e.g., Infura or Alchemy)
- MetaMask wallet on Sepolia testnet (for testing)
- Novocoin test tokens (ERC-20 on Sepolia)

## 📜 Smart Contract Info

- **Token Name:** Novocoin (NOV)
- **Standard:** ERC-20
- **Network:** Sepolia
- **Contract Address:** `0x...` (TODO: Insert deployed contract address)
- **Decimals:** 3

## 🛠 Tech Stack

- Oracle APEX (plugin development)
- JavaScript (for web3 integration)
- Ethereum JSON-RPC
- MetaMask for wallet connection
- Web3.js or Ethers.js (based on implementation)

## 📄 License

MIT License. See [LICENSE](../LICENSE) for details.

---

Built with ❤️ by [Novoshore Europe](https://novoshore.com).
