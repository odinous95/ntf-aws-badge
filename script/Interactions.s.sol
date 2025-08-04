// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {CertNFT} from "../src/OdinAwsCert.sol";

/**
 * @title MintCertNFT
 * @dev Script to mint a new NFT using the CertNFT contract.
 * This script retrieves the most recently deployed CertNFT contract and mints a new NFT with a predefined token URI.
 * This is useful for testing and demonstration purposes, an interction with the CertNFT contract.
 */
contract MintCertNFT is Script {
    string public constant TOKEN_URI =
        "https://ipfs.io/ipfs/bafkreia3ubfxks6yjj3jet73lxkzhrbcsgg62pwb4zrarqgzarjvfvmhei";

    function run() external {
        // Retrieve the most recently deployed CertNFT contract address using DevOpsTools
        address mostRecentlyDeployedBasicNft = 0x4056f91014D29F862A8F78D977e430B89BcC84c8;
        mintNftOnContract(mostRecentlyDeployedBasicNft);
    }

    function mintNftOnContract(address basicNftAddress) public {
        vm.startBroadcast();
        CertNFT(basicNftAddress).mintCertNft(TOKEN_URI);
        vm.stopBroadcast();
    }
}
