
This smart contract implements the ERC20 standard with additional functionalities such as token purchases using ETH, administrative controls for minting and burning tokens, and ownership management.

---

## Folder Structure

### `dist` Folder
The distribution folder contains the packaged version of the Oracle APEX plugin. This includes:
- The deployable Oracle APEX plugin file for easy import into an APEX environment.
- Documentation for plugin usage.

### `src` Folder
The source folder is organized into three subdirectories:
1. **Images Folder**: Contains visual elements such as icons and UI graphics used in the plugin.
2. **jQuery Folder**: Includes JavaScript files leveraging jQuery to provide dynamic and interactive features.
3. **SQL Folder**: Contains SQL scripts for database interactions required by the plugin (e.g., token tracking).

---

## Ethereum Token Assignment Project

### Overview
In addition to the plugin, we have developed a project that showcases how ETH can be assigned to an Ethereum smart contract directly from an Oracle APEX application. This project demonstrates:
1. Integration of blockchain functionality into low-code environments like Oracle APEX.
2. Real-world use cases for deploying smart contracts and interacting with them via web interfaces.

---

## Documentation Links

For further reference on Oracle APEX APIs:
- [Oracle APEX JavaScript API Reference (Release 22.1)](https://docs.oracle.com/en/database/oracle/apex/22.1/aexjs/toc.html)
- [PL/SQL API Documentation (Release 22.1)](https://docs.oracle.com/en/database/oracle/apex/22.1/aeapi/toc.htm)

---

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

---

## Contact Information

For more information about this plugin or other Oracle APEX-related services:
- Visit [Novoshore](https://www.novoshore.com)
- Email us at hello@novoshore.com