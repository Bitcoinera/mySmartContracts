pragma solidity ^0.5.0;

contract AdvancedStorage {
    uint[] public ids;

    function addID(uint id) public {
        ids.push(id);
    }

    function getOneID(uint position) view public returns(uint) {
        return ids[position];
    }

    function getIDs() view public returns(uint[] memory) {
        return ids;
    }

    function getLengthIDs() view public returns(uint) {
        return ids.length;
    }
}