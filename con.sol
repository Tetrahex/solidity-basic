// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.15;

enum State {
  Waiting,
  Active,
  Ready
}

struct Person {
  string _firstName;
  string _lastName;
}

contract MyContract {
  string public value = "initial Value";
  State public state = State.Waiting;
  Person[] public people;
  uint256 public peopleCount = 0;
  mapping(uint256 => Person) public peopleMap;

  address owner;

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  constructor() {
    owner = msg.sender;
  }

  function setValue(string memory _value) public {
    value = _value;
  }

  function activate() public {
    state = State.Active;
  }

  function isActive() public view returns (bool) {
    return state == State.Active;
  }

  function addPerson(string memory _firstName, string memory _lastName)
    public
    onlyOwner
  {
    people.push(Person(_firstName, _lastName));
  }

  function addPersonToMap(string memory _firstName, string memory _lastName)
    public
    onlyOwner
  {
    incrementCount();
    peopleMap[peopleCount] = Person(_firstName, _lastName);
  }

  function incrementCount() internal {
    peopleCount += 1;
  }
}
