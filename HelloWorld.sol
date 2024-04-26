// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract HelloWorld {
    string public say;
    address public owner;
    mapping (address=>string) public word;
    mapping (address=>bool) public list;

    constructor(){
        owner = msg.sender ;
    }
    function setword(string memory newword) public {
        require(list[msg.sender],"You are not in the whitelist");
        word[msg.sender]=newword;
    }
    function addlist(address newaddress) public OnlyOwner{
        list[newaddress]=true;
    }
    modifier OnlyOwner(){
        require(msg.sender==owner,"Only owner can call this function");
        /*address(this) == owner 更適合於內部函數調用，
          msg.sender == owner 更適合於外部帳戶或其他合約調用時驗證擁有者身份*/
        _;
    }

}