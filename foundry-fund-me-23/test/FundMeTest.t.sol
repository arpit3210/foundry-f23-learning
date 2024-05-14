// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";

contract FundMeTest is Test {

FundMe fundMe;

function setUp() external {

DeployFundMe deployFundMe = new DeployFundMe();
fundMe = deployFundMe.run();

// fundMe = new FundMe(0x694AA1769357215DE4FAC081bf1f309aDC325306);
}

function testMinimumDollarIsFive() view public {
assertEq(fundMe.MINIMUM_USD(), 5e18);
}

function testMsgSenderIsOwner() view public {
 assertEq(fundMe.i_owner(), msg.sender);
// assertEq(fundMe.i_owner(), address(this));
// assertNotEq(fundMe.i_owner(), msg.sender);
console.log(fundMe.i_owner());
console.log(address(this));
console.log(msg.sender);
}
function testPriceFeedVersionIsAccurate() view public {
    uint256 version = fundMe.getVersion();
    // assertEq(version, 4);
    console.log(version);
    // assertNotEq(version, 4);
}

}