// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract SendMoney {
    address[] public funders;
    mapping(address => uint) public amountFunded;
    address public immutable owner;

    constructor() {
        owner = msg.sender;
    }

    function sendEth() public payable {
        require(msg.value > 5*10**18, "amount should be atleast 5 ETH");
        funders.push(msg.sender);
        amountFunded[msg.sender]=msg.value;
        assert(amountFunded[msg.sender] == msg.value);
    }

    function withdrawToOwner() public {
        require(msg.sender == owner, "Only owner can use this function");
        for (uint i = 0; i < funders.length; i++) {
            address funderAddress = funders[i];
            amountFunded[funderAddress] = 0;
        }
        funders = new address[](0);
        (bool success, ) = payable(msg.sender).call{value: address(this).balance}("");
        if (!success) {
            revert("Transaction Failed!");
        }
    }
}
