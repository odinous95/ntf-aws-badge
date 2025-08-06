// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

/**
 * @title CertNFT
 * @dev A simple ERC721 contract for minting NFTs with a token URI.
 * This contract allows anyone to mint a new NFT by providing a token URI.
 * The token ID is automatically incremented for each new mint.
 */
contract CertNFT is ERC721 {
    uint256 private s_tokenIdCounter;
    mapping(uint256 tokenId => string tokenUri) private tokenIdToUri;

    constructor() ERC721("CERTI", "ODINAWSCERT") {
        s_tokenIdCounter = 0;
    }

    /**
     * @dev Mints a new NFT with the given token URI.
     * This function allows anyone to mint a new NFT by providing a token URI.
     * The token URI is stored in a mapping for later retrieval.
     * The token ID is automatically incremented for each new mint.
     * @notice This function is public and can be called by anyone.
     * @dev The function uses the `_safeMint` method from the ERC721 contract to
     * ensure that the minting process is safe and compliant with the ERC721 standard.
     * @param newTokenURI The URI for the new token.
     */
    function mintCertNft(string memory newTokenURI) public {
        // take the uri and store it in the mapping | we stored the tokenURI in the mapping
        tokenIdToUri[s_tokenIdCounter] = newTokenURI;
        // mint the NFT to the sender
        _safeMint(msg.sender, s_tokenIdCounter);
        // increment the tokenId counter
        s_tokenIdCounter++;
    }

    /**
     * @dev Returns the token URI for a given token ID.
     * @param tokenId The ID of the token to query.
     * @return The URI of the token.
     */
    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        if (ownerOf(tokenId) == address(0)) {
            revert("Token does not exist");
        }
        return tokenIdToUri[tokenId];
    }
}
