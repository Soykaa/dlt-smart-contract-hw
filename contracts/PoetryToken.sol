// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// Author: @soykaa
contract PoetryToken is ERC721 {
    uint256 public tokenIdCounter;
    mapping(uint256 => string) private _poetryMapping;

    event PoetryPublished(address indexed author, uint256 indexed tokenId, string poetryText);

    constructor() ERC721("PoetryToken", "PT") {}

    function publishPoetry(string memory poetryText) external returns (uint256) {
        tokenIdCounter++;
        _safeMint(msg.sender, tokenIdCounter);
        _setPoetryText(tokenIdCounter, poetryText);
        return tokenIdCounter;
    }

    function getPoetryText(uint256 tokenId) external view returns (string memory) {
        require(_ownerOf(tokenId) != address(0), "Token doesn't exist");
        return _poetryMapping[tokenId];
    }

    function _setPoetryText(uint256 tokenId, string memory poetryText) private {
        require(_ownerOf(tokenId) != address(0), "Token doesn't exist");
        _poetryMapping[tokenId] = poetryText;
        emit PoetryPublished(msg.sender, tokenIdCounter, poetryText);
    }
}
