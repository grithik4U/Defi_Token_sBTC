<div id="top">

<!-- HEADER STYLE: CLASSIC -->
<div align="center">


# DEFI_TOKEN_SBTC

<em>Empower Your Wealth with Synthetic Bitcoin Innovation</em>

<!-- BADGES -->
<img src="https://img.shields.io/github/last-commit/grithik4U/Defi_Token_sBTC?style=flat&logo=git&logoColor=white&color=0080ff" alt="last-commit">
<img src="https://img.shields.io/github/languages/top/grithik4U/Defi_Token_sBTC?style=flat&color=0080ff" alt="repo-top-language">
<img src="https://img.shields.io/github/languages/count/grithik4U/Defi_Token_sBTC?style=flat&color=0080ff" alt="repo-language-count">

<em>Built with the tools and technologies:</em>

<img src="https://img.shields.io/badge/JSON-000000.svg?style=flat&logo=JSON&logoColor=white" alt="JSON">

</div>
<br>

---

Project Overview: Tokenizing Synthetic Bitcoin (sBTC) Using Ethereum, Chainlink, and Remix
🧭 Goal of the Project
To explore the concept of tokenizing real-world financial assets by creating a smart contract that issues a synthetic version of Bitcoin (sBTC) — a digital token whose value is anchored to the real-world BTC price using live data from Chainlink price oracles.

This project demonstrates:

The basics of real-world asset (RWA) tokenization

Collateralized minting using ETH

Oracle integration for real-time pricing

Smart contract development and deployment on the Sepolia testnet

🛠️ Tech Stack & Tools
Component	Description
Solidity	Smart contract programming language
Remix IDE	Web-based IDE for Solidity development
MetaMask	Wallet used for deploying and transacting
Sepolia Testnet	Ethereum test network for testing
Chainlink	Oracle network to fetch ETH/USD and BTC/USD prices
OpenZeppelin	Standard ERC-20 token implementation

🔗 What the Smart Contract Does
Mints a synthetic BTC token (sBTC) when a user sends ETH

Uses Chainlink’s ETH/USD and BTC/USD price feeds to calculate:
sBTC minted = (ETH deposited in USD) / (BTC price in USD)
Ensures the token has 18 decimals like ETH

All minting happens on-chain, with no admin intervention

The contract holds the ETH as collateral, simulating how DeFi protocols back synthetic assets

🔐 Smart Contract Highlights
Uses AggregatorV3Interface from Chainlink for price data

Inherits ERC20 from OpenZeppelin

mintWithEther() is the core function:

Takes in ETH

Fetches live prices

Calculates how much sBTC to mint

Mints and assigns tokens to the sender

✅ What Was Achieved
Contract successfully deployed and verified on Sepolia

Live Chainlink oracles integrated

ETH deposited → real-time price logic executed → sBTC minted

Transactions and token balance confirmed on Etherscan

🧠 Key Learnings
Precision matters: tiny ETH amounts can result in zero tokens minted due to Solidity’s integer math

Chainlink oracles are easy to integrate but require correct price scaling (1e8)

Even simple DeFi contracts involve careful math and data validation


---

- **Programming Language:** Solidity
  <img width="1492" alt="Screenshot 2025-05-22 at 18 04 11" src="https://github.com/user-attachments/assets/ed237a71-9f08-4972-b3a2-4211142f51bc" />
<img width="1492" alt="Screenshot 2025-05-22 at 18 04 36" src="https://github.com/user-attachments/assets/896fe2ed-0987-4d8a-90d8-eef879add9e7" />
<img width="1492" alt="Screenshot 2025-05-22 at 18 04 54" src="https://github.com/user-attachments/assets/7ddd83ca-acec-4c3f-8547-8b5d567c7e51" />
<img width="1492" alt="Screenshot 2025-05-22 at 18 05 36" src="https://github.com/user-attachments/assets/72f67e3b-202e-477c-b9ae-72a4b0606b13" />



  

