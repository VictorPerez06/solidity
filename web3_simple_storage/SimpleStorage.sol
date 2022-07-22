//SPDX-Liscence-Identifier: MIT

pragma solidity ^0.6.0;

contract SimpleStorage {
    uint256 x;

    struct People {
        uint256 x;
        string name;
    }

    People[] public people;
    //People[1] public people; for fixed size

    mapping(string => uint256) public nameTox;

    function store(uint256 _x) public {
        x = _x;
    }

    // view , pure just reading; pure is doing math but not saving
    function retrieve() public view returns (uint256) {
        return x;
    }

    function addP(string memory _name, uint256 _x) public {
        people.push(People(_x, _name));
        nameTox[_name] = _x;
    }
}
