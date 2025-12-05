# MyToken (MTK)

## Overview
MyToken is a simple ERC-20 compatible token built on Ethereum for learning purposes.

## Token Details
- **Name**: MyToken
- **Symbol**: MTK
- **Decimals**: 18
- **Total Supply**: 1,000,000 MTK

## Features
- ✅ Standard ERC-20 implementation
- ✅ Transfer tokens between addresses
- ✅ Approve and transferFrom functionality
- ✅ Event emission for transparency
- ✅ Balance tracking

## How to Deploy
1. Open RemixIDE
2. Create new file `MyToken.sol`
3. Paste the contract code
4. Compile with Solidity 0.8.x
5. Deploy with desired total supply

## How to Use
```solidity
// Check token balance
balanceOf(address) → uint256

// Transfer tokens
transfer(address to, uint256 amount) → bool

// Approve another wallet / DApp to spend your tokens
approve(address spender, uint256 amount) → bool

// Check approved spending limit
allowance(address owner, address spender) → uint256

// Transfer tokens on behalf of another (after approval)
transferFrom(address from, address to, uint256 amount) → bool
