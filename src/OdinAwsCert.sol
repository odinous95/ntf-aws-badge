// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract AwsCert is ERC721 {
    uint256 private s_tokenIdCounter;
    mapping(uint256 tokenId => string tokenUri) private tokenIdToUri;

    constructor() ERC721("CERTI", "ODINAWSCERT") {
        s_tokenIdCounter = 0;
    }

    function mintCertNft(string memory newTokenURI) public {
        // take the uri and store it in the mapping | we stored the tokenURI in the mapping
        tokenIdToUri[s_tokenIdCounter] = newTokenURI;
        // mint the NFT to the sender
        _safeMint(msg.sender, s_tokenIdCounter);
        // increment the tokenId counter
        s_tokenIdCounter++;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        if (ownerOf(tokenId) == address(0)) {
            revert("Token does not exist");
        }
        return tokenIdToUri[tokenId];
    }
}
