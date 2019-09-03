pragma solidity ^0.5.11;

interface ERC20 {
  function totalSupply() external view returns (uint256);
  function balanceOf(address account) external view returns (uint256);
  function transfer(address recipient, uint256 amount) external returns (bool);
  function allowance(address owner, address spender) external view returns (uint256);
  function approve(address spender, uint256 value) external returns (bool);
  function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
  event Transfer(address from, address to, uint256 value);
  event Approval(address owner, address spender, uint256 value);
}

contract TutorialToken is ERC20 {
  mapping(address => uint) balances;
  mapping(address => mapping (address => uint256)) allowances;

  address public _owner; 
  uint _totalSupply;
  
  event Mint(uint256 value);
  event Burn(uint256 value);
  
  constructor() public {
    _owner = msg.sender;
  }
  
  function totalSupply() external view returns (uint256){
    return _totalSupply;
  }
  
  function mint(uint256 amount) external {
    require(msg.sender == _owner, "Only owner can mint tokens");
    balances[_owner] += amount;
    _totalSupply += amount;
    emit Mint(amount);
  }
  
  function burn(uint256 amount) external {
    require(msg.sender == _owner, "Only owner can burn tokens");
    require(balances[_owner] >= amount, "You don't have enough tokens in your account to burn");
    balances[_owner] -= amount;
    _totalSupply -= amount;
    emit Burn(amount);
  }  
  
  function balanceOf(address account) external view returns (uint256){
    return balances[account];
  }
  
  function transfer(address recipient, uint256 amount) external returns (bool){
    _transfer(msg.sender, recipient, amount);
  }
  
  //moved duplicate logic in transfer and transferFrom to its own internal function
  function _transfer(address sender, address recipient, uint amount ) private {
    require(recipient != address(0x0), "Transfer to the zero address blocked");
    require(balances[sender] >= amount, "You don't have enough money to make this transfer");
    balances[sender] -= amount;
    balances[recipient] += amount;
    emit Transfer(sender, recipient, amount);
  }
  
  function allowance(address owner, address spender) external view returns (uint256){
    return allowances[owner][spender];
  }
  
  function approve(address spender, uint256 value) external returns (bool){
    allowances[msg.sender][spender] = value;
    emit Approval(msg.sender, spender, value);
  }
  
  function transferFrom(address sender, address recipient, uint256 amount) external returns (bool){
    require(allowances[sender][msg.sender] >= amount, "You are not authorized to make this transfer");
    _transfer(sender, recipient, amount);
  }
}
