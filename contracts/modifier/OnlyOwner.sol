pragma solidity ^0.8.0;

contract OnlyOwner {
    address private _owner;

    constructor(address owner) {
        _owner = owner;
    }

    modifier onlyOwner() {
        require(_owner == msg.sender, "Caller must be the owner");
        _;
    }
}
