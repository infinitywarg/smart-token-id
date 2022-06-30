<p align="center">
 <img src="https://github.com/infinitywarp/smart-token-id/blob/main/images/smrt-nft.jpg" alt="Smart NFT" width="250"></a>
</p>

<h3 align="center">Smart Token Ids</h3>

<div align="center">
</div>

---

<p align = "center">💡 Solidity library to encode token metadata into token id. Can be used with ERC721 and ERC1155 tokens for encoding NFT metadata upto 256-bits. 💡</p>

## What is a Smart Token Id?

ERC721 and ERC1155 tokenization standards have the concept of token id which uniquely defines a particular #token type, such that single or multiple supply of each token id can be minted.

Although the metadata of a token id is kept offchain (mostly using IPFS) in many use cases, there's a requirement to have some metadata #onchain.

Examples:

- Collectibles NFT DNA
- Parameters for Ggenerative Art
- Attributes of a financial instrument
- And many others...

This on-chain metadata can be maintained in the token contract's state variables using structs and mappings. However, such implementation requires that any frontend/backend which may need that metadata, or another contract which may build transactions using that metadata, must query the token contract each time.

Solidity has 256-bit unsigned integers as token ids. What if we encode on-chain metadata into the token id itself, so that it can be destructured anytime, anywhere?

These are two reference implementations of such 'Smart Token Ids' using bitwise operators.

## Reference Implementations

In both implementations, developers are expected to know the metadata before encoding it into a token id.

- Solid Token Id: Metadata is defined in a struct such that total bit lengths of all struct members sum to 256-bits. Solidity packs the entire struct into a single storage slot.
- Liquid Token Id: Metadata is passed as an array of uint256 with a corresponding array of bit lengths such that they sum to 256-bits.

If the sum is less than 256 bits, please prefix another data with remaining bits and value 0.

Difference between the two implementations is that Solid Token Ids cannot be changed once developed and deployed, while Liquid Token Ids are relatively malleable and can be changed by changing input arrays.

Each implementation has two functions:

- id() encodes a Smart Token Id from input struct or array containing metadata
- metadata() decodes a Smart TokenId into struct or array containing metadata

Next enhancement is removing the exact 256-bit sum requirement.

## Disclaimer

Although anyone is free to use this code, it is still experimental and not production ready. For any problems arising out of the use of this code, monetory or otherwise, into any smart contract projects, the organization and any contributing developers will NOT be responsible.
