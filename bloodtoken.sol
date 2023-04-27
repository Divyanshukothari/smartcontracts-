// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";


contract bldtkn is ERC20 {
       address public owner;

       constructor() ERC20("BLOOD","BLD"){
           owner =  msg.sender;
       }

       event newValidator(address newvali);

       event deleteValidator(address removeVali);

       error failowner();


       mapping(address => bool) internal _donors;

       mapping(address => bool ) internal _validators;  
         
      modifier onlyOwner(){
       require(owner == msg.sender);
          _;
      }

      function addValidator(address _validator) public onlyOwner returns(bool){
          bool success = _validators[_validator] = true;
           
         if(!success){
             revert failowner();
         }
         emit newValidator(_validator);

         return success;
      }
       

    function removeValidator(address _validator) public onlyOwner returns(bool){
            bool success = _validators[_validator] = false;
           
         if(!success){
             revert failowner();
         }
         emit deleteValidator(_validator);

         return success;

    }

    function addDonor(address donor) public {
        require(_validators[msg.sender] , "you are not validator");
        _donors[donor] = true;
       
    }

    function mint() public {
      require(_donors[msg.sender]);
      _mint(msg.sender , 50);
      _mint(owner, 10);
    }

    // only need to apply time delay functionlty so that validators cannot 
    // again and again add donor/people for miniting our token;
   
}
