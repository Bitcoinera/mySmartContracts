pragma solidity ^0.5.0;
//pragma experimental ABIEncoderV2;

contract Crud {
    struct User {
       uint id;
       string name; 
    }
    User[] public userArr;
    uint public nextId;

    function createUser(string memory name) public {
        User memory newUser = User(nextId, name);
        userArr.push(newUser);
        nextId++;
    }
    
    function getUser(uint id) view public returns(uint, string memory) {
        return(userArr[id].id, userArr[id].name);
    }
    
    function updateUser(uint id, string memory name) public {
        userArr[id].name = name;
    }
    
    function deleteUser(uint id) public {
        delete userArr[id];
    }
    
    /*function getUsers() view public returns(User[] memory) {
        return userArr;
    }*/
}