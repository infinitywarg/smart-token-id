//SPDX-License-Identifier: MIT
pragma solidity =0.8.8;

contract LiquidSmartToken {
    function id(uint256[] memory data, uint8[] memory bits)
        public
        pure
        returns (uint256 tokenId)
    {
        uint256 n = bits.length;
        require(n < 256, "Overflow");
        require(checksum(bits) == 256, "Incorrect Sum");
        require(data.length == n, "Mismatch");
        uint256 shift = 256;

        for (uint8 i = 0; i < n - 1; i++) {
            shift -= bits[i];
            tokenId = tokenId | (data[i] << shift);
        }

        tokenId = tokenId | data[n - 1];
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
