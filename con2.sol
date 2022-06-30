// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.15;

contract MyContract {
  mapping(address => uint256) public balances;
  address payable wallet;

  event Purchase(address indexed _buyer, uint256 _amount);

  constructor(address payable _wallet) {
    wallet = _wallet;
  }

  fallback() external payable {}

  receive() external payable {
    buyTokens();
  }

  function buyTokens() public payable {
    balances[msg.sender] += 1;

    wallet.transfer(msg.value);

    emit Purchase(msg.sender, 1);
  }
}
