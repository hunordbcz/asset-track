pragma solidity ^0.8.0;

import "./access/Owner.sol";


contract MainManagement is Owner {

    uint32 private newAssetPrice = 10_000;

    mapping(address => bool) manufacturers;
    mapping(address => bool) approvals;

    constructor() Owner(msg.sender){

    }

//    Should it be payable ? If yes, then use the approval method:
//    Owner approve
    function approveForManufacturerRole(address to) onlyOwner external {
        approvals[to] = true;

        emit Approval(to, tokenId);
    }

    function redeemManufacturerRole() payable external {
        //Check if approved
        //Redeem payment and set manufacturer role
        //remove approval
    }
}


}
