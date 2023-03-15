// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract MultiCall {
    // for just reading data from another contract - staticcall
    function viewMultiCall(
        address[] calldata targets,
        bytes[] calldata data
    ) external view returns (bytes[] memory) {
        require(targets.length == data.length, "target & data length mismatch");

        bytes[] memory results = new bytes[](data.length);

        for (uint i; i < targets.length; i++) {
            (bool success, bytes memory result) = targets[i].staticcall(
                data[i]
            );
            require(success, "call failed");
            results[i] = result;
        }

        return results;
    }

    // useful for modifying the state or creating an actual transaction - call
    function trxMultiCall(
        address[] calldata targets,
        bytes[] calldata data
    ) external returns (bytes[] memory) {
        require(targets.length == data.length, "target & data length mismatch");

        bytes[] memory results = new bytes[](data.length);

        for (uint i; i < targets.length; i++) {
            (bool success, bytes memory result) = targets[i].call(data[i]);
            require(success, "call failed");
            results[i] = result;
        }

        return results;
    }
}
