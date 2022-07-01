//SPDX-License-Identifier: MIT
pragma solidity =0.8.8;

contract LiquidSmartToken {
    function id(uint256[] memory data, uint8[] memory bits) public pure returns (uint256 tokenId) {
        require(data.length == bits.length, "Mismatch");
        require(bits.length < 256, "Overflow");
        require(checksum(bits) == 256, "Checksum");

        uint256 shift = 256;

        for (uint8 i = 0; i < bits.length - 1; i++) {
            shift -= bits[i];
            tokenId = tokenId | (data[i] << shift);
        }

        tokenId = tokenId | data[bits.length - 1];
    }

    function metadata(uint256 tokenId, uint8[] memory bits) public pure returns (uint256[] memory data) {
        require(bits.length < 256, "Overflow");
        require(checksum(bits) == 256, "Checksum");

        uint256 shift = 256;

        for (uint8 i = 0; i < bits.length - 1; i++) {
            shift -= bits[i];
            data[i] = (tokenId & ((2**bits[i] - 1) << shift)) >> shift;
        }
    }

    function checksum(uint8[] memory input) public pure returns (uint8 sum) {
        for (uint8 i = 0; i < input.length; i++) {
            sum += input[i];
        }
    }

    // test data: [111,222,333,444,555,666,777,888]
    // test bitlength: [32,32,32,32,32,32,32,32]
    // test output: 2992554081447237602950561849613000299444520332556689264239491665625976
}
