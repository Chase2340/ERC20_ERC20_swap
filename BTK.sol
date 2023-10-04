// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BitchToken is ERC20, ERC20Burnable, Ownable {
    uint256 constant public MIN_VALUE = 1 ether;
    uint256 constant public RATE = 10; 

    constructor() ERC20("BitchToken", "BTK") {
        _mint(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2, 1000 * 10**decimals());
    }
    // Функция для обмена с эфиром
    function exchangeTokensForEther() external payable  {
        uint256 receivedAmount = msg.value;
        require(receivedAmount > MIN_VALUE, "LO value");
         uint256 tokenAmount = receivedAmount * RATE;
        _mint(msg.sender, tokenAmount);
    }
}