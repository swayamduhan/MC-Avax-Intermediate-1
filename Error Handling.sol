// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Metacrafters Solidity-Intermediate Module 1 
// Contract should use require(), assert() and revert()

contract ErrorHandling {
    string public cong = "Congratulations! Value successfully entered";
    uint public num;

//Function to tell the user what to enter as value
    function valueRequirements(string memory) public pure returns (string memory) {
        return "Enter a value between 1 to 100 excluding 17 in setValue.";
    }

// Function to enter a value between 1 to 100 excluding 17
    function setValue(uint x) public returns (string memory){

        // reverts the function if 17 is entered
        if (x == 17) {
            revert ("17 is not allowed");
        }

        // a value between 1 to 100 should be added
        require(x > 0 && x <= 100, "Enter number between 1 and 100");

        //to check any interal error which led to unassignment of value to variable
        assert(x != 0);
        
        num = x;

       return cong;

    }


// Function to call the value set by user
    function getValue() public view returns(uint) {
        return num;
    }

      
}
