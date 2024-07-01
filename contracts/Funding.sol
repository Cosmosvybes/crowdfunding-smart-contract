// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Funding {
    string name;
    address payable _owner;

    mapping(address => uint256) _contribution_rewards;
    uint public _fundingTarget;
    uint _rate = 5;
    //?? for every wei depoisted contributors get 10 points

    constructor(
        address payable _address,
        string memory _name,
        uint _target
    ) public {
        _fundingTarget = _target;
        _owner = _address;
        name = _name;
    }
    uint256 public _calculatedPoints;

    function _reward() public payable returns (uint256) {
        uint _points = msg.value / _rate / 10 ** 15;
        return _calculatedPoints = _points;
    }

    function _deposit() public payable returns (bool success, uint256 balance) {
        if (_fundingTarget == _owner.balance) {
            return (false, _owner.balance);
        } else {
            _reward();
            _owner.transfer(msg.value);
            _contribution_rewards[msg.sender] =
                _contribution_rewards[msg.sender] +
                _calculatedPoints;
            return (true, _calculatedPoints);
        }
    }

    function balanceOfTarget() public view returns (uint256) {
        return _owner.balance;
    }

    function _reward_balance(address _address) public view returns (uint256) {
        return _contribution_rewards[_address];
    }

    modifier isOwner() {
        require(_owner == msg.sender, "Permission denied");
        _;
    }
    function _withdraw(
        address payable _to
    ) public payable isOwner returns (bool success) {
        _to.transfer(msg.value);
        return true;
    }
}
