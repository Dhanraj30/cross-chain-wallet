// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Script} from "forge-std/Script.sol";
import {TokenTransferor} from "../src/TokenTransferor.sol";
import "forge-std/console.sol";

contract DeployTokenTransferor is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address routerAddress = vm.envAddress("ROUTER_ADDRESS");
        address linkTokenAddress = vm.envAddress("LINK_TOKEN_ADDRESS");

        vm.startBroadcast(deployerPrivateKey);

        TokenTransferor transferor = new TokenTransferor(routerAddress, linkTokenAddress);

        console.log("TokenTransferor deployed at:", address(transferor));

        vm.stopBroadcast();
    }
}
