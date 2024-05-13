// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    // function setUp() public {}

    function run() public returns (FundMe) {
// before startBroadcast --> Not a "real" tx

HelperConfig helperConfig = new HelperConfig();
address ethUsdPriceFeed = helperConfig.activeNetworkConfig();


        vm.startBroadcast();

        // after start broadcast gonna be real tx
        // Mock
        FundMe fundMe = new FundMe(ethUsdPriceFeed);
        vm.stopBroadcast();
        return fundMe;
    }
}
