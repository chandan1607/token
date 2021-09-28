pragma solidity >=0.4.22 <0.9.0;

import "./Token.sol";

contract TokenSale {
    Token public tokenContract;
    address admin;
    uint256 public tokenPrice;
    uint256 public tokensSold;

    event Sell(address _buyer, uint256 _amount);

    constructor(Token _tokenContract, uint256 _tokenPrice) public {
        tokenContract = _tokenContract;

        tokenPrice = _tokenPrice;
    }
    function buyTokens(uint256 _numberOfTokens) public payable {
        tokensSold += _numberOfTokens;

        emit Sell(msg.sender, _numberOfTokens);
    }
}
