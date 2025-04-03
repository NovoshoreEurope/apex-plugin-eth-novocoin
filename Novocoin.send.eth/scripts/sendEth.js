require('dotenv').config();
const Web3 = require('web3').default;

// Conecta a Sepolia usando Alchemy
const web3 = new Web3(process.env.ALCHEMY_URL);

// Tu cuenta
const privateKey = process.env.PRIVATE_KEY.startsWith('0x')
  ? process.env.PRIVATE_KEY
  : '0x' + process.env.PRIVATE_KEY;

const account = web3.eth.accounts.privateKeyToAccount(privateKey);
web3.eth.accounts.wallet.add(account);

// Dirección del contrato al que vas a enviar ETH
const contractAddress = process.env.CONTRACT_ADDRESS;

// Función para obtener el balance de una cuenta o contrato
async function getBalance(address) {
  const balanceWei = await web3.eth.getBalance(address);
  return web3.utils.fromWei(balanceWei, 'ether');
}

// Función principal para enviar ETH
async function sendEther() {
  try {
    console.log("=== Información Inicial ===");
    console.log(`Clave privada utilizada: ${privateKey}`);
    console.log(`Dirección de la cuenta emisora: ${account.address}`);
    console.log(`Dirección del contrato: ${contractAddress}`);

    // Obtener balances iniciales
    const senderBalance = await getBalance(account.address);
    const contractBalance = await getBalance(contractAddress);

    console.log(`Saldo de la cuenta emisora: ${senderBalance} ETH`);
    console.log(`Saldo del contrato antes de la transacción: ${contractBalance} ETH`);

    // Configuración de la transacción
    const tx = {
      from: account.address,
      to: contractAddress,
      value: web3.utils.toWei("0.002", "ether"),
    };

    // Estimar gas necesario
    const estimatedGas = await web3.eth.estimateGas(tx);
    tx.gas = estimatedGas;

    console.log(`Gas estimado para la transacción: ${estimatedGas}`);

    // Enviar la transacción
    const receipt = await web3.eth.sendTransaction(tx);

    console.log("\n✅ Transacción enviada exitosamente:");
    console.log(`Hash de la transacción: ${receipt.transactionHash}`);

    // Obtener balances después de la transacción
    const updatedSenderBalance = await getBalance(account.address);
    const updatedContractBalance = await getBalance(contractAddress);

    console.log("\n=== Información Posterior ===");
    console.log(`Saldo de la cuenta emisora después de la transacción: ${updatedSenderBalance} ETH`);
    console.log(`Saldo del contrato después de la transacción: ${updatedContractBalance} ETH`);
  } catch (err) {
    console.error("\n❌ Error al enviar ETH:", err.message);
    console.error("\n❌ Error:", err);
  }
}

// Ejecutar función principal
sendEther();