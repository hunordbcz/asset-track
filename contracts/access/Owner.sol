pragma solidity ^0.8.0;

contract Owner {
    address payable private _owner;

    constructor(address payable owner) {
        _owner = owner;
    }

    modifier onlyOwner() {
        require(_owner == msg.sender, "Caller must be the owner");
        _;
    }

    function _getOwner() private view returns (address payable) {
        return _owner;
    }
}
