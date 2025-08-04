// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {CertNFT} from "../src/OdinAwsCert.sol";
import {DeployContract} from "../script/DeployContract.s.sol";
/**
 * @title CertNFTTest
 * @dev A test contract for the CertNFT contract.
 * This contract tests the basic functionality of the CertNFT contract,
 * including minting NFTs and checking balances.
 * This is useful for ensuring that the CertNFT contract behaves as expected
 * and that the minting process works correctly.
 */

contract CertNFTTest is Test {
    DeployContract public deployerCertNFT;
    CertNFT public certNFT;
    address public USER = makeAddr("user");

    string public constant TOKEN_URI =
        "https://ipfs.io/ipfs/bafkreia3ubfxks6yjj3jet73lxkzhrbcsgg62pwb4zrarqgzarjvfvmhei";

    function setUp() public {
        deployerCertNFT = new DeployContract();
        certNFT = deployerCertNFT.run();
    }

    function testNameIsCorrect() public view {
        string memory expectedName = "CERTI";
        string memory actualName = certNFT.name();
        assertEq(actualName, expectedName);
    }

    function testCanMintAndHaveBalance() public {
        vm.prank(USER);
        certNFT.mintCertNft(TOKEN_URI);
        assertEq(certNFT.balanceOf(USER), 1, "User should have a balance of 1 after minting");
        assertEq(certNFT.tokenURI(0), TOKEN_URI, "Token URI should match the provided URI");
    }
}
