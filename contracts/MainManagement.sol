pragma solidity ^0.8.0;

import "./access/Owner.sol";


contract MainManagement is Owner {

    uint256 private registrationPrice;

    mapping(address => bool) manufacturers;
    mapping(address => bool) approvals;

    constructor() Owner(msg.sender) {
        registrationPrice = 10;
    }

    function setRegisterPrice(uint256 newPrice) onlyOwner external {
        registrationPrice = newPrice;
        //todo event of new price
    }

    function getRegisterPrice() view public returns (uint256){
        return registrationPrice;
    }

    function approveForManufacturerRole(address to) onlyOwner external {
        approvals[to] = true;
        //todo event of new approval
    }

    function redeemManufacturerRole() payable external {
        //Check if the sender may redeem the manufacturer role
        require(approvals[msg.sender] == true, "Address must be approved");

        //Check payment
        require(msg.value >= registrationPrice, "Not enough ethereum sent");
        uint256 toReturn = msg.value - registrationPrice;
        if (toReturn > 0) {
            msg.sender.transfer(toReturn);
        }

        //remove approval
        approvals[msg.sender] = false;

        //todo event for new manufacturer role
    }

    function isManufacturer(address account) view external returns (bool) {
        return manufacturers[account];
    }

    function withdrawToOwner( uint256 amount) external onlyOwner {
        (bool sent, bytes memory data) = _getOwner().call{value : amount}("");
        require(sent, "Failed to withdraw ETH to owner");

        //todo Event for withdraw
    }
}
