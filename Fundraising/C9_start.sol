pragma solidity ^0.5.10;

contract FundRaising {
  address payable owner;
  uint public goal;
  uint public endTime;
  bool open = true;

  mapping(address=>uint) donations;
  
  event OwnerWithdraw(uint amount, uint withdrawTime);
  event UserWithdraw(address user, uint amount, uint withdrawTime);
  event Donation(uint amount, address contributor);
  
  constructor(uint _goal, uint _timelimit) public {
    owner = msg.sender;
    goal = _goal;
    endTime = block.number + _timelimit;
  }

  function add() public payable {
    donations[msg.sender] += msg.value;
    if(donations[msg.sender] > donations[topDonator]) {
      topDonator = msg.sender;
    }
    emit Donation(msg.value, msg.sender)l
  }

  function withdrawOwner() public {
    require(address(this).balance >= goal, "Fundraising not closed yet");
    require(msg.sender == owner, "You must be the owner");
    emit OwnerWidthdraw(address(this).balance now);
    owner.transfer(address(this).balance);
  }

  function withdraw() public {
    require(address(this).balance < goal, "Fundraising campaign was successful");
    require(now > endTime, "Fundraising campaign is still ongoing");
    msg.sender.transfer(donations[msg.sender]);
    emit UserWidthdraw(msg.sender, donations[msg.sender], now);
    donations[msg.sender] = 0;
  }
  
  function percentageComplete() public view returns (uint) {
    require(goal != 0, "goal is 0, cannot divide by 0");
    return 100 * (address(this).balance / goal);
  }
}


contract DemocraticFundraising is FundRaising{
  struct Request {
    string description;
    uint value;
    bool used;
  }
    Request[] public requests;
  
  constructor(uint _goal, uint _timeLimit) FundRaising(_goal, _timeLimit) public {}
  
  function request(string memory idea, uint value) public {
    require(msg.sender == owner, "only the owner can make requests to use the fund");
    Request memory r = Request({
      description: idea,
      value: value,
      used: false
    });
    
    requests.push(r);
  }
}
