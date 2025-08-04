// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {CertNFT} from "../src/OdinAwsCert.sol";

contract DeployContract is Script {
    function run() external returns (CertNFT) {
        vm.startBroadcast();
        CertNFT certNFT = new CertNFT();
        vm.stopBroadcast();
        return certNFT;
    }
}
