// Import the 'Novo' contract that we have deployed in Truffle
const Novocoin = artifacts.require("Novocoin");

contract("Novocoin", (accounts) => {
  let novoInstance;

  // Before each test, deploy the contract and get its instance
  before(async () => {
    novoInstance = await Novocoin.deployed();
  });

  // Test case: Ensure the contract is deployed with the correct name and symbol
  it("should deploy correctly with the right name and symbol", async () => {
    // Get the name and symbol of the deployed contract
    const name = await novoInstance.name();
    const symbol = await novoInstance.symbol();
    
    // Assert that the contract name and symbol are correct
    assert.equal(name, "Novocoin");
    assert.equal(symbol, "NOV");
  });

  // Test case: Ensure that the total supply is assigned to the owner's address
  it("should assign total supply to owner", async () => {
    // Get the balance of the owner (first account in the accounts array)
    const balanceOwner = await novoInstance.balanceOf(accounts[0]);
    // Get the total supply of tokens from the contract
    const totalSupply = await novoInstance.totalSupply();
    
    // Assert that the balance of the owner is equal to the total supply
    assert.equal(balanceOwner.toString(), totalSupply.toString());
  });
});