// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol"; // Keep the destruction function and increase community interactivity
import "@openzeppelin/contracts/access/Ownable.sol"; // Required! Used to control who can issue additional shares

contract UnitedStatesTreasuryBond is ERC20, ERC20Burnable, Ownable {
    constructor(address initialOwner)
        ERC20("United States Treasury Bond", "USTB") // <-- Great name
        Ownable(initialOwner)
    {
        // Initial issuance: 34 trillion coins, a tribute to U.S. Treasury bonds!
        _mint(initialOwner, 34_000_000_000_000 * 10**decimals());
    }

    // Core function: Allows the contract owner (digital Fed Chairman) to issue tokens based on the issuance of US Treasury bonds
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
