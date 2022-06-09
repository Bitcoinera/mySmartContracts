// SPDX-License_Identifier: MIT

pragma solidity ^0.8.0;

import "./SimpleStorage.sol"; 

contract StorageFactory {

    SimpleStorage public simpleStorage;
    SimpleStorage[] public simpleStorageArray;
    
    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorage = new SimpleStorage();
        simpleStorage = newSimpleStorage;
    }

    function ssStore(uint256 _simpleStorageFavoriteNumber) public {
        simpleStorage.store(_simpleStorageFavoriteNumber);
    }

    function ssGet() view public returns(uint256) {
        return simpleStorage.getFavoriteNumber();
    }

    // Array of Simple Storage Contracts

    function createSSContractArray() public {
        SimpleStorage newSimpleStorage = new SimpleStorage();
        simpleStorageArray.push(newSimpleStorage);
    }
    
    function sArrayStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // Address 
        // ABI 
        // SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).store(_simpleStorageNumber);
        simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
    }
    
    function sArrayGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        // return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).retrieve();
        return simpleStorageArray[_simpleStorageIndex].getFavoriteNumber();
    }
}