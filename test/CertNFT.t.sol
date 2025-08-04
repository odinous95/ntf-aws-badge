// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {CertNFT} from "../src/OdinAwsCert.sol";
import {DeployContract} from "../script/DepolyContract.s.sol";

contract CertNFTTest is Test {
    DeployContract public deployerCertNFT;
    CertNFT public certNFT;

    function setUp() public {
        deployerCertNFT = new DeployContract();
        certNFT = deployerCertNFT.run();
    }

    function testNameIsCorrect() public view {
        string memory expectedName = "CERTI";
        string memory actualName = certNFT.name();
        assertEq(actualName, expectedName);
    }

    // function testMintCertNft() public {
    //     string memory tokenURI = "https://example.com/token/1";
    //     certNFT.mintCertNft(tokenURI);

    //     uint256 tokenId = 0; // First token ID
    //     assertEq(certNFT.tokenURI(tokenId), tokenURI);
    //     assertEq(certNFT.ownerOf(tokenId), address(this));
    // }

    // function testTokenURIRevertsForNonExistentToken() public {
    //     vm.expectRevert("Token does not exist");
    //     certNFT.tokenURI(1); // Token ID 1 does not exist
    // }
}
