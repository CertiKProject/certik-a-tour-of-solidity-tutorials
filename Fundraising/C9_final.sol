pragma solidity ^0.5.10;

contract FundRaising {
  address payable owner;
  uint public goal;
  uint public endTime;
  uint public totalContribution = 0;
  bool open = true;

  mapping(address=>uint) donations;
  
  event OwnerWithdraw(uint amount, uint withdrawTime);
  event UserWithdraw(uint amount, uint withdrawTime);
  event AddFund(uint amount, address contributer);

  constructor(uint _goal, uint _timeLimit) public {
    owner = msg.sender;
    goal = _goal;
    endTime = block.number + _timeLimit;
  }
  
  function getBalance(address _addr) public view returns(uint){
    return donations[_addr];
  }

  function add() public payable {
    require(open, "the campaign is finished");
    require(msg.value > 0, "You need to send some ether");
    donations[msg.sender] += msg.value;
    totalContribution += msg.value;
    emit AddFund(msg.value, msg.sender);
  }

  function withdrawOwner() public {
    require(msg.sender == owner, "You must be the owner");
    require(totalContribution >= goal, "Fundraising not closed yet");
    open = false;
    emit OwnerWithdraw(totalContribution, endTime);
    owner.transfer(address(this).balance);
  }

  function withdraw() public {
    require(block.number > endTime, "Fundraising not closed");
    require(totalContribution < goal, "Can not withdraw when fundraising was successful");
    uint amount = donations[msg.sender];
    totalContribution -= amount;
    donations[msg.sender] = 0;
    emit UserWithdraw(amount, block.number);
    address(msg.sender).transfer(amount);
  }
  
  function monitor() public view returns(uint) {
    require(goal != 0, "goal is 0, cannot divide by 0");
    return totalContribution * 100 / goal;
  }
}

contract FundRaisingWithAllowance is FundRaising{
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
    return requests[a].allowed > totalContribution/2;
  }
  
  function useRequested(uint a) public {
    require(msg.sender == owner, "only owner can use the fund");
    require(checkAllowance(a), "not allowed to use yet");
    require(totalContribution >= goal, "can only use the funds when the goal is met");
    msg.sender.transfer(requests[a].value);
  }
}