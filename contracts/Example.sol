// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@zondax/filecoin-solidity/contracts/v0.8/MarketAPI.sol";
import "@zondax/filecoin-solidity/contracts/v0.8/types/MarketTypes.sol";
import "@zondax/filecoin-solidity/contracts/v0.8/DataCapAPI.sol";

contract Example {
    function name() public returns (string memory) {
        return DataCapAPI.name();
    }
}
