// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract PoetryToken is ERC721 {
    uint256 private _tokenIdCounter;
    mapping(uint256 => string) private _poetryText;

    constructor() ERC721("PoetryToken", "PT") {}

    function publishPoetry(string memory poetryText) external returns (uint256) {
        _tokenIdCounter++;
        _mint(msg.sender, _tokenIdCounter);
        _setPoetryText(_tokenIdCounter, poetryText);
        return _tokenIdCounter;
    }

    function getPoetryText(uint256 tokenId) external view returns (string memory) {
        require(_ownerOf(tokenId) != address(0), "Token doesn't exist");
        return _poetryText[tokenId];
    }

    function _setPoetryText(uint256 tokenId, string memory poetryText) private {
        require(_ownerOf(tokenId) != address(0), "Token doesn't exist");
        _poetryText[tokenId] = poetryText;
    }
}
