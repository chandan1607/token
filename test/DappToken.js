var Token = artifacts.require("./Token.sol");

contract('Token', function (accounts) {

  it('sets the total supply upon deployment', function () {
    return Token.deployed().then(function (instance) {
      tokenInstance = instance;
      return tokenInstance.totalSupply();
    }).then(function (totalSupply) {
      assert.equal(totalSupply.toNumber(), 2000000, 'sets the total supply to 1,000,000');
    });
  });
})
