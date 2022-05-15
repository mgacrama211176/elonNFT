//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;


//ERC721 - NFT tokens
//ERC721A - azuki (NFT collection on OpenSea)
//ERC1155 - metaschool

//every NFT is unique. Counters

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol"; 

contract ElonNFT is ERC721URIStorage {
   using Counters for Counters.Counter;
   Counters.Counter private _tokenIds; //0
 
   constructor() ERC721("ElonMusk", "ELON") {}

   //NFT
   //Name, Descrition, Image, Attributes
 
   function mintNFT()
       public
       returns (uint256)
       {
           _tokenIds.increment(); //1
           uint256 newItemId = _tokenIds.current();
           _mint(msg.sender, newItemId); //calling the contract - us.
           _setTokenURI(newItemId, "https://jsonkeeper.com/b/PY8P");
           console.log("The NFT ID %s has been minted to %s", newItemId, msg.sender);
           return newItemId;
       }
}