// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./MTK.sol";
import "./BTK.sol";

contract TokenSwap {
    IERC20 public token1;
    address public owner1;
    IERC20 public token2;
    address public owner2;
    uint256 public Min_value = 1;
    uint256 public Rate = 5;
    
    


    constructor(
        address _token1,
        address _owner1,
        address _token2,
        address _owner2
    ) {
        token1 = IERC20(_token1);
        owner1 = _owner1;
        token2 = IERC20(_token2);
        owner2 = _owner2;
    }

    function swap(uint256 tradeAmount) external returns(uint256 _outputAmount) {
        require(
            token2.allowance(msg.sender, address(this)) >= tradeAmount,
            "Token 1 allowance too low"
        );

       _outputAmount = tradeAmount * 5;
       token2.transferFrom(msg.sender, address(this), tradeAmount);
       token1.transfer(msg.sender, _outputAmount);
        return _outputAmount; 
    }
}