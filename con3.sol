// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.15;

contract ERC20Token {
  string public name;
  mapping(address => uint256) public balances;

  function mint() public {
    balances[tx.origin]++;
  }
}

contract MyContract {
  address payable wallet;
  address token;

  constructor(address payable _wallet, address _token) {
    wallet = _wallet;
    token = _token;
  }

  fallback() external payable {}

  receive() external payable {
    buyTokens();
  }

  function buyTokens() public payable {
    wallet.transfer(msg.value);
    ERC20Token(address(token)).mint();
  }
}
