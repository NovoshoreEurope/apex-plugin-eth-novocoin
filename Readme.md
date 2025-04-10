
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

## Ethereum Token Assignment Project

### Overview
In addition to the plugin, we have developed a project that showcases how ETH can be assigned to an Ethereum smart contract directly from an Oracle APEX application. This project demonstrates:
1. Integration of blockchain functionality into low-code environments like Oracle APEX.
2. Real-world use cases for deploying smart contracts and interacting with them via web interfaces.


## Documentation Links

For further reference on Oracle APEX APIs:
- [Oracle APEX JavaScript API Reference (Release 22.1)](https://docs.oracle.com/en/database/oracle/apex/22.1/aexjs/toc.html)
- [PL/SQL API Documentation (Release 22.1)](https://docs.oracle.com/en/database/oracle/apex/22.1/aeapi/toc.htm)


## Tools Used

To develop and deploy this plugin locally or on testnets/mainnets, we used:

1. **Node.js (v14 or later)**  
   Essential for running development tools like Truffle and Ganache.

2. **Truffle Framework**  
   Provides a suite of tools for compiling contracts, deploying them on blockchains, and testing their functionality.

3. **Ganache**  
   Used as a local blockchain environment for testing smart contracts during development.

4. **MetaMask Wallet**  
   Enables wallet management and interaction with deployed contracts on Ethereum networks.
