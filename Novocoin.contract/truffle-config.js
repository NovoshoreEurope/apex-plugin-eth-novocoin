require('dotenv').config();
const HDWalletProvider = require('@truffle/hdwallet-provider');

module.exports = {
  networks: {
    development: {
      host: "127.0.0.1", // Localhost (Ganache)
      port: 7545,
      network_id: "*",    // Any network ID
    },
    infura_sepolia: {
      provider: () => new HDWalletProvider(
        process.env.PRIVATE_KEY, // Use your mnemonic stored in .env
        `https://sepolia.infura.io/v3/${process.env.INFURA_PROJECT_ID}` // Infura URL
      ),
      network_id: 11155111,   // Sepolia network ID
      confirmations: 1,
      timeoutBlocks: 100,
      skipDryRun: true
    },
    alchemy_sepolia: {
      provider: () => new HDWalletProvider(
        process.env.PRIVATE_KEY, // Use your mnemonic stored in .env
        `https://eth-sepolia.g.alchemy.com/v2/${process.env.ALCHEMY_PROJECT_ID}` // Infura URL
      ),
      network_id: 11155111
    },
  },
  compilers: {
    solc: {
      version: "0.8.0",  // Use a compatible Solidity version
    },
  },
};
