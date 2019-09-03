pragma solidity ^0.5.10;
/*This is the buggy smart contract you should try to hack*/
contract WealthShares {
	uint sharePrice = 10 ether;
	mapping(address=>uint) public shares;
	event Ints(uint, uint, uint, uint);

	function buyShares(uint numShares) public payable {
		require(msg.value/sharePrice >= numShares, "buyShares failed: Not enough Ether sent to buy the shares");
		shares[msg.sender] = safeAdd(shares[msg.sender], numShares);
	}
	
	function cashOut(uint numShares) public payable {
		require(shares[msg.sender] >= numShares, "cashOut failed: You don't have enough shares");
		shares[msg.sender] = safeSubtract(shares[msg.sender], numShares);
		emit Ints(numShares, sharePrice, numShares*sharePrice, address(this).balance);
		msg.sender.transfer(numShares*sharePrice);
	}

	function transferShares(uint numShares, address recipient) public  {
		require(shares[msg.sender] >= numShares, "transferShares failed: You don't have enough shares");
	  shares[recipient] = safeAdd(shares[recipient], numShares);
		shares[msg.sender] = safeSubtract(shares[msg.sender], numShares);
	}

	function divideShares(uint numShares, address[] memory recipients) public {
		uint total = numShares * recipients.length;
		require(shares[msg.sender] >= total, "divideShares failed: You don't have enough shares");
		for(uint i = 0; i < recipients.length; i++) {
			address b = recipients[i];
		   // uint q = shares[recipients[i]] + numShares;
			shares[recipients[i]] = safeAdd(shares[recipients[i]], numShares);
		}
		shares[msg.sender] = safeSubtract(shares[msg.sender], total);
	}

	function safeAdd(uint a, uint b) internal returns (uint){
		uint c = a+b;
		require(c >= a, "Addition overflow");
		return c;
	}

	function safeSubtract(uint a, uint b) internal returns (uint) {
		require(b <= a, "Subtraction underflow");
		return a-b;
	}
}

/* Deploy the hacker simulation contract to easily create a simulation of 
	a contract that has been funded by multiple users other than yourself
*/
contract HackerSimulation {
	event PaymentFrom(address);
	event Log(string);
	event Value(uint);
	event VulnerableAccountBalance(uint);
	event GotPaid(uint);

	WealthShares vuln;
	
	function createSimulation( ) public payable {
		//send this contract 10 ether to begin the game 
		// we simulate various parties paying the vulnerable contract this ether, your goal 
		// is to steal it back
		require(address(vuln) == address(0x0), "Game already created");
		require(msg.value >= 100 ether, "To create the game, deposit one hundred ether to steal back");
	
		vuln = new WealthShares();
		for(uint i = 0; i < 5; i++) {
			Payer p = new Payer();
			p.pay.value(20 ether)(vuln);
			emit PaymentFrom(address(p));
		}

		emit Log("Simulation environment created!");
	}
	
	function hack(/* feel free to add parameters here */) public payable returns(uint) {
		require(address(vuln)!=address(0x0), "Vulnerable contract must be deployed. Run createSimulation then run this function");

		/*************
		TODO: Change this function so that it will steal all the funds from vuln
		*************/

	}
	
	//check to see if hack is successful
	function checkVictory() public returns(bool) {
		//we won if we can set the vulnerable contract's balance to zero 
		emit VulnerableAccountBalance(address(vuln).balance);
		return address(vuln) != address(0x0) && address(vuln).balance < 1 ether;
	}
	
	//check the vulnerable contract's state, useful for testing purposes
	function readSharesFromVuln(address _addr) public returns (uint) {
		return vuln.shares(_addr);
	}

	//it is necessary that a fallback function like this exists in order for this contract
	//  to receive payments
	function () external payable {
		emit GotPaid(msg.value);
	}
}

/*
simulate different users paying the vulnerable contract.  
*/
contract Payer {
	uint public value;
	function pay(WealthShares accountToPay) public payable {
		accountToPay.buyShares.value(20 ether)(2);
	}
}
