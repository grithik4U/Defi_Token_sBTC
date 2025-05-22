// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// Import Chainlink's price feed interface and OpenZeppelin ERC20 library
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// Our token contract
contract SyntheticAssetToken is ERC20 {
    // Chainlink Aggregator interfaces for price feeds
    AggregatorV3Interface internal ethUsdPriceFeed;
    AggregatorV3Interface internal btcUsdPriceFeed;
    address public owner;
    
    constructor() ERC20("Synthetic Bitcoin", "sBTC") {
        owner = msg.sender;
        // Initialize the Chainlink price feed contracts (addresses for Sepolia)
        ethUsdPriceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        btcUsdPriceFeed = AggregatorV3Interface(0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43);
    }
    
    // Function to get latest BTC price in USD (8 decimal places)
    function getLatestBtcPrice() public view returns (int) {
        (, int price,,,) = btcUsdPriceFeed.latestRoundData();
        return price;  // price is scaled by 1e8 (Chainlink USD feeds have 8 decimals)
    }
    
    // Mint new synthetic asset tokens by depositing ETH as collateral
    function mintWithEther() external payable {
        require(msg.value > 0, "Must send ETH to mint tokens");
        // Fetch current prices from oracles
        (, int ethPrice,,,) = ethUsdPriceFeed.latestRoundData();   // ETH price in USD (1e8 scale)
        (, int btcPrice,,,) = btcUsdPriceFeed.latestRoundData();   // BTC price in USD (1e8 scale)
        require(ethPrice > 0 && btcPrice > 0, "Invalid oracle price");
        
        // Convert int prices to uint for calculation
        uint256 ethPriceUint = uint256(ethPrice);
        uint256 btcPriceUint = uint256(btcPrice);
        
        // Calculate how many tokens to mint: (ETH_value_in_USD / BTC_price_in_USD)
        // msg.value is the amount of ETH sent (in wei). To get its USD value:
        // (msg.value * ethPrice) / 1e18 gives the USD value in terms of the 8-decimal price.
        uint256 depositValueInUsd_scaled = (msg.value * ethPriceUint) / 1e18;
        // Now calculate equivalent BTC amount (scaled to 8 decimals) by dividing by BTC price.
        // This result will be in 8 decimals too, so multiply by 1e10 to convert to 18 decimals for token.
        uint256 btcAmount_scaled = (depositValueInUsd_scaled * (10 ** 10)) / btcPriceUint;
        
        // Mint synthetic BTC tokens to the user
        _mint(msg.sender, btcAmount_scaled);
    }
}
