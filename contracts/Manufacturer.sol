pragma solidity ^0.8.0;

import "./access/Owner.sol";
import "./Asset.sol";

contract Manufacturer is Owner {
    bytes32 name;
    mapping(uint32 => Asset) assets;

    constructor(bytes32 manufacturerName, address owner) OnlyOwner(owner) {
        name = manufacturerName;
    }

    function
}
