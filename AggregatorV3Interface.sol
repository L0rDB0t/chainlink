// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@chainlink/contracts/src/v0.8/VRFConsumerBase.sol"; //solo ejemplo

contract CovenContract is VRFConsumerBase {

    uint bloodDigits = 16;
    uint bloodModulus = 10 ** bloodDigits;

    bytes32 public keyHash;
    uint256 public fee;
    uint256 public randomResult;

    struct Vampire {
        string name;
        uint blood;
    }

    Vampire[] public vampires;

    constructor() VRFConsumerBase(
        0x6168499c0cFfCaCD319c818142124B7A15E857ab, // VRF Coordinator
        0x01BE23585060835E02B77ef475b0Cc51aA1e0709  // LINK Token
    ) public{
        keyHash = 0x2ed0feb3e7fd2022120aa84fab1945545a9f2ffc9076fd6156fa96eaff4c1311;
        fee = 100000000000000000;

    }

    function _createVampire(string memory _name, uint _blood) private {
        vampires.push(Vampire(_name, _blood));
    }


    function getRandomNumber() public returns (bytes32 requestId) {
        return requestRandomness(keyHash, fee);
    }

    function fulfillRandomness(bytes32 requestId, uint256 randomness) internal override {
        randomResult = randomness;
    }

}

