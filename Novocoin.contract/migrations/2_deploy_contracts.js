const Novocoin = artifacts.require("Novocoin");

module.exports = function (deployer, network, accounts) {
  deployer.deploy(Novocoin);
};