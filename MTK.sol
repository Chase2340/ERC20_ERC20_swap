// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, ERC20Burnable, Ownable {
    uint256 constant public MIN_VALUE = 1 ether;
    uint256 constant public RATE = 5;
  

    constructor() ERC20("MyToken", "MTK") {
         _mint(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 1000 * 10**decimals());
    }
    // Функция для обмена с эфиром
    function exchangeTokensForEther() external payable  {
        uint256 receivedAmount = msg.value;
        require(receivedAmount > MIN_VALUE, "LO value");
         uint256 tokenAmount = receivedAmount * RATE;
        _mint(msg.sender, tokenAmount);
    }
}
