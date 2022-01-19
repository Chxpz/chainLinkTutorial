// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import './ChainLinkDataFeed.sol';

contract CheckMyPrice is PriceConsumerV3 {

    uint256 myPrice;
    uint256 counter;

    function setMyPrice(uint256 _myPrice) public {
        myPrice = _myPrice;
    }

    function getMyPrice()public view returns(uint256){
        return myPrice;
    }

    function getExternalPrice() public view returns(int){
        return _getLatestPrice();
    }

    function _updateCounter() internal {
        counter++;
    }

    function getCounter() public view returns(uint){
        return counter;
    }

    function compare() public {
      uint256 checkedPrice = uint256(_getLatestPrice());
      if (myPrice >= checkedPrice){
      _updateCounter();
      }  
    }

}