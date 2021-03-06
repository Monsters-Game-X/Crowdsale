pragma solidity ^0.4.24;

import "./SafeMath.sol";
import "./Ownable.sol";
import "./TimedCrowdsale.sol";


/**
 * @title FinalizableCrowdsale
 * @dev Extension of Crowdsale where an owner can do extra work
 * after finishing.
 */
contract FinalizableCrowdsale is Ownable, TimedCrowdsale {
  using SafeMath for uint256;

  bool public isFinalized = false;

  event Finalized();
  
  constructor(uint256 _rate, address _wallet, MonstersGameXToken _token, uint256 _cap, uint256 _openingTime, uint256 _closingTime) public
    TimedCrowdsale(_rate, _wallet, _token, _cap, _openingTime, _closingTime) 
  {
  }

  /**
   * @dev Must be called after crowdsale ends, to do some extra finalization
   * work. Calls the contract's finalization function.
   */
  function finalize() public onlyOwner {
    require(!isFinalized);
    require(hasClosed());

    finalization();
    emit Finalized();

    isFinalized = true;
}

  /**
   * @dev Can be overridden to add finalization logic. The overriding function
   * should call super.finalization() to ensure the chain of finalization is
   * executed entirely.
   */
  function finalization() internal {
  }

}
