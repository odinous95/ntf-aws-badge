// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {CertNFT} from "../src/OdinAwsCert.sol";

/**
 * @title DeployContract
 * @dev Script to deploy the CertNFT contract.
 * This script uses the Forge standard library to deploy the contract to the blockchain.
 * The `run` function starts a broadcast, deploys the contract, and stops the broadcast.
 * The deployed contract instance is returned for further interaction if needed.
 * This is useful for setting up the contract before minting NFTs or performing other interactions.
 */
contract DeployContract is Script {
    function run() external returns (CertNFT) {
        vm.startBroadcast();
        CertNFT certNFT = new CertNFT();
        vm.stopBroadcast();
        return certNFT;
    }
}
