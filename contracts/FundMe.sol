// SPDX-License_Identifier: MIT

pragma solidity ^0.8.0;

//import "./7_ChainlinkPriceConsumerV3.sol";
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 public constant MINIMUM_USD = 50 * 10 ** 18;

    function fund() public payable {
        // convert mininumUsd to ETH
        require(getConversionRate(msg.value) >= MINIMUM_USD, "Didn't send enough ETH");
    }

    function getETHPrice() internal view returns (uint256) {
        // ABI
        // Address 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e in Rinkeby
        // Found address here https://docs.chain.link/docs/ethereum-addresses/
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        (,int256 price,,,) = priceFeed.latestRoundData();
        // ETH in terms of USD
        return uint256(price * 1e10);
    }

    function getVersion() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        return priceFeed.version();
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getETHPrice();
        uint256 ethAmountInUsd = (ethAmount * ethPrice) / 1e18;
        return ethAmountInUsd; 
    }
}
