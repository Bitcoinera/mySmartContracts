// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.7;

contract SimpleStorage {
    struct Person {
        string name; 
        uint256 favoriteNumber;
    }

    uint256 favoriteNumber;
    Person[] public people;

    mapping(string => uint256) nameToFavoriteNumber;
    mapping(uint256 => string) favoriteNumberToName;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    // This should be possible in theory but for some reason cannot make it work out. Some research is due
    // function addPerson(Person memory _newPerson) public {
    //     people.push(_newPerson);
    // }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(Person( _name, _favoriteNumber ));
        nameToFavoriteNumber[_name] = _favoriteNumber;
        favoriteNumberToName[_favoriteNumber] = _name;
    }

    function getFavoriteNumber() public view returns(uint256) {
        return favoriteNumber;
    }

    function getNameWithNumber(uint256 _favoriteNumber) public view returns(string memory) {
        return favoriteNumberToName[_favoriteNumber];
    }
}
