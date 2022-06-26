# Smart Token Ids

ERC721 and ERC1155 token standards have the concept of token id which can uniquely defines a paricular token type, such that single or multiple supply of each token id can be minted.

Although the metadata of a token id is kept off-chain (mostly using IPFS) in many use cases, the requirement is to have some metadta on-chain.

Some examples would be:

- Collectible NFT DNA
- Parameters for Generative Art
- Attributes of a financial instrument
- Many others...

This on-chain metadata can be maintained in the token contract state variables using structs and mappings.

However, such an implementation requires that any frontend/backend which may require that metadata, or another contract which may build transactions using thet metadata, must query the token contract each time.

Solidity provides 256-bit unsigned integers as token ids. What if we encode the on-chain metadata into the token id itself, so that it can be destructured anytime, anywhere when required.

These are two reference implementations of such 'Smart Token Ids' using bitwise operators.

In both implementations, developers are expected to know the metadata before incoding it into a token id.

- Solid Token Id: Metadata is defined in a struct such that total bit lengths of all struct members sum to 256-bits. Solidity packs the entire struct into a single storage slot.
- Liquid Token Id: Metadata is passed as an array of uint256 with a corresponding array of bit lengths such that they sum to 256-bits.

If the sum is less than 256 bits, please add a prefix variable with remaining bits and value 0.
The difference between two implementations is that Solid Token Ids cannot be changed once developed and deployed, while Liquid Token Ids are relatively malleable and can be changed by changing input arrays.

Each implementation has two functions id() and metadata():

- id() encodes a Smart Token Id from input struct or array containing metadata
- metadata() decodes a Smart TokenId into struct or array containing metadata

# Disclaimer

Although anyone is free to use this code, it is still experimental.
I am attempting to remove the exact 256-bit sum requirement.
It would be apprecaited if any developer wishes to contribute and raise an issue with the code to make these implementations more robust.
