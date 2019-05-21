pragma solidity ^0.5.0;

contract SimpleStorage {
    string public data;
    function setData(string memory _data) public {
        data = _data;
    } 
}
