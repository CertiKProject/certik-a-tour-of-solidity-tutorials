pragma solidity ^0.5.10;

contract FundRaising {
  address payable owner;
  uint public goal;
  uint public endTime;
  bool open = true;
  address public topDonator;

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
    emit Donation(msg.value, msg.sender);
  }

  function withdrawOwner() public {
    require(address(this).balance >= goal, "Fundraising not closed yet");
    require(msg.sender == owner, "You must be the owner");
    emit OwnerWithdraw(address(this).balance, now);
    owner.transfer(address(this).balance);
  }

  function withdraw() public {
    require(address(this).balance < goal, "Fundraising campaign was successful");
    require(now > endTime, "Fundraising campaign is still ongoing");
    msg.sender.transfer(donations[msg.sender]);
    emit UserWithdraw(msg.sender, donations[msg.sender], now);
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
    uint allowed;
  }
  Request[] public requests;
  mapping(address=>mapping(uint=>bool)) voted;
  
  constructor(uint _goal, uint _timeLimit) FundRaising(_goal, _timeLimit) public {}
  
  function request(string memory idea, uint value) public {
    require(msg.sender == owner, "only the owner can make requests to use the fund");
    Request memory r = Request({
      description: idea,
      value: value,
      used: false,
      allowed: 0
    });
    
    requests.push(r);
  }
  
  function vote(uint a) public {
    require(!voted[msg.sender][a], "already voted.");
    require(donations[msg.sender] > 0, "can't vote if you didn't donate!");
    requests[a].allowed += donations[msg.sender];
    voted[msg.sender][a] = true;
  }
  
  function checkAllowance(uint a) public view returns(bool) {
    return requests[a].allowed > address(this).balance/2;
  }
  
  function useRequested(uint a) public {
    require(msg.sender == owner, "only owner can use the fund");
    require(checkAllowance(a), "not allowed to use yet");
    require(address(this).balance >= goal, "can only use the funds when the goal is met");
    msg.sender.transfer(requests[a].value);
  }
}
