// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract SimpleCollectible is ERC721URIStorage {
    uint256 public tokenCounter;
    mapping(uint256 => string) private _tokenURIs;

    constructor() ERC721("Collection Test", "TEST") {
        tokenCounter = 0;
    }

    function createCollectible(string memory _tokenURI)
        public
        returns (uint256)
    {
        uint256 newItemId = tokenCounter;
        _safeMint(msg.sender, newItemId);
        _setTokenURI(newItemId, _tokenURI);
        _tokenURIs[newItemId] = _tokenURI;
        tokenCounter = tokenCounter + 1;
        return newItemId;
    }

    function tokenURI(uint256 tokenId)
        public
        view
        virtual
        override
        returns (string memory)
    {
        _requireMinted(tokenId);

        return _tokenURIs[tokenId];
    }

    function setTokenURI(uint256 tokenId, string memory _uri) external {
        _requireMinted(tokenId);
        _tokenURIs[tokenId] = _uri;
    }
}
