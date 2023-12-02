//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract checkingError {
    function testRequire(uint _num) public pure {
        require(_num > 10 && _num < 500, "Input must be greater than 10 and less than 500");
    }

    function testRevert(uint _num) public pure {
        if (_num <= 10) {
            revert("Input must be greater than 10");
        }
    }

    uint public num;

    function testAssert() public view {
        assert(num == 0);
    }
}
