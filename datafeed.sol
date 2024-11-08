// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import '@chainlink/contracts/src/v0.8/AutomationCompatibleInterface.sol'; //solo ejemplo

contract PriceConsumerV3 {

AggregatorV3Interface public priceFeed;

constructor() public {

priceFeed = AggregatorV3Interface(0x0715A7794a1dc8e42615F059dD6e406A6594651A);

 }

  function getLatestPrice() public view returns (int) {
    (,int price,,,) = priceFeed.latestRoundData();
    return price;
  }

  function getDecimals() public view returns (uint8) {
    uint8 decimals = priceFeed.decimals();
    return decimals;
  }

}
