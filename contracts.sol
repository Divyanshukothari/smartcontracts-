// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; 

contract isAddress{
// this is openzepplin implementation of this contract
  function  isValidAddress(address addr) public view returns(bool){
      return addr.code.length>0;
  }
// but their is way to bypass this



}
