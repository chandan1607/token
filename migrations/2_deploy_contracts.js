var Token = artifacts.require("./Token.sol");
var TokenSale = artifacts.require("./TokenSale.sol");

module.exports = function (deployer) {
  tokenPrice = 1000000000000000;
  deployer.deploy(Token, 1000000).then(function () {
    return deployer.deploy(TokenSale, Token.address, tokenPrice);
  });

};
