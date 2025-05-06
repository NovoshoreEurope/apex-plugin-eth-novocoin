# 🔁 Sending ETH to a Contract on Sepolia using Web3.js and Alchemy

This script allows you to send a specific amount of ETH from an account (controlled via private key) to a smart contract deployed on the **Sepolia** test network, using **Alchemy** as the node provider and **Web3.js** as the Ethereum client.

## 📦 Requirements

- Node.js v14 or higher
- An [Alchemy](https://alchemy.com/) account with Sepolia access
- Test ETH on the Sepolia network
- A properly configured `.env` file

## 📁 Installation

1. Clone this repository or copy the script into your project.
2. Install dependencies:

```bash
npm install dotenv web3
```

3. Create a `.env` file with the following variables:

```env
ALCHEMY_URL=https://eth-sepolia.g.alchemy.com/v2/your_api_key
PRIVATE_KEY=your_private_key_without_0x
CONTRACT_ADDRESS=0xYourContractAddress
```

> 💡 **Important:** Never share your private key. This script is intended for development and testing only.

## 🚀 Usage

Run the script with:

```bash
node sendEth.js
```

You'll get detailed output in the console showing:

- Private key and sender address (only for test environments—feel free to remove the key from logs)
- Initial balances of the sender and contract
- Estimated gas
- Transaction hash
- Post-transaction balances

## 🔐 Security Notice

- This script **should not be used in production** without serious modifications (secure key management, input validation, robust error handling).
- Do not commit your `.env` file to public repositories.

## 🧠 What It Does

- Connects to Sepolia via Alchemy
- Converts your private key into a usable Web3 account
- Estimates the required gas to send 0.002 ETH to the contract
- Sends the transaction and logs pre/post balances

## 🛠️ Possible Enhancements

- Add a CLI interface to specify amount and destination
- Implement retry logic for congested networks
- Persist logs to a file

## 📄 License

MIT License. See [LICENSE](../LICENSE) for details.

---

Built with ❤️ by [Novoshore Europe](https://novoshore.com).