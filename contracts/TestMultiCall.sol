// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract TestMultiCall {
    function test1(uint _i) external pure returns (uint) {
        return _i * 2;
    }

    function test2(uint _i) external pure returns (uint) {
        return _i * 4;
    }

    // for demo purpose to get bytes form data of calling function
    function getData1(uint _i) external pure returns (bytes memory) {
        return abi.encodeWithSelector(this.test1.selector, _i);
    }

    function getData2(uint _i) external pure returns (bytes memory) {
        return abi.encodeWithSelector(this.test2.selector, _i);
    }
}
