//SPDX-License-Identifier: MIT
pragma solidity =0.8.8;

contract SolidSmartToken {
    struct Metadata {
        address data1;
        uint32 data2;
        uint16 data3;
        uint8 data4;
        bytes3 data5;
        bytes2 data6;
    }

    function id(Metadata memory data) public pure returns (uint256 tokenId) {
        tokenId =
            (uint256(uint160(data.data1)) << 96) |
            (uint256(data.data2) << 64) |
            (uint256(data.data3) << 48) |
            (uint256(data.data4) << 40) |
            (uint256(uint24(data.data5)) << 16) |
            uint256(uint16(data.data6));
    }

    function metadata(uint256 tokenId)
        public
        pure
        returns (Metadata memory data)
    {
        data.data1 = address(uint160((tokenId & (((2**160 - 1) << 96) >> 96))));
        data.data2 = uint32((tokenId & ((2**32 - 1) << 64)) >> 64);
        data.data3 = uint16((tokenId & ((2**16 - 1) << 48)) >> 48);
        data.data4 = uint8((tokenId & ((2**8 - 1) << 40)) >> 40);
        data.data5 = bytes3(uint24((tokenId & (((2**24 - 1) << 16) >> 16))));
        data.data6 = bytes2(uint16(tokenId & (2**16 - 1)));
    }

    // test input: ["0x5B38Da6a701c568545dCfcB03FcB875f56beddC4","1111","222","33","0xabcdef","0x9999"]
    // test output: 41260920106969412157321674113669319076297763250177730572509110742263752792473
}
