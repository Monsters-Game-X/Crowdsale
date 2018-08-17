pragma solidity ^0.4.24;

import "./FinalizableCrowdsale.sol";

contract MonstersGameXTokenCrowdsale is FinalizableCrowdsale {
    
  constructor(uint256 _rate, address _wallet, address _token) public
    FinalizableCrowdsale(_rate, _wallet, MonstersGameXToken(_token), 1000000, 1534377600, 1542326400) {
    // (eth/token rate, withdrawal wallet, token address, crowdsale cap, crowdsale start date, crowdsale end date)
  }
  
  function setRate(uint256 newRate) public onlyOwner {
      rate = newRate;
  }
  
  function sendTokens(address beneficiary, uint256 tokensAmount) public onlyOwner {
    require(beneficiary != address(0));
    _processPurchase(beneficiary, tokensAmount);
    TokenSending(beneficiary, tokensAmount); // event
  }
}