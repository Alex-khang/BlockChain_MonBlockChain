// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
contract Wallet{
    address private owner;
    address[] users;
    mapping (address => uint256) public balances;

    constructor(){
        owner = msg.sender;
    }
    function deposit() external payable {
        if(balances[msg.sender] == 0 && msg.value > 0)
            users.push(msg.sender);
        balances[msg.sender] += msg.value;
    }
    function withdraw(uint256 amount) external {
        require(msg.sender == owner, "Denied!");

        require(amount <= address(this).balance, "You are not enough moeny");

        payable (msg.sender).transfer(amount);

        balances[msg.sender] -= amount;
    }

    function ShowAlluser() public  view  returns(address[] memory){
        return users;
    }
    function balanceOf(address user)public  view  returns (uint256){
         require(msg.sender == owner, "You are not owner");

         return balances[user];
    }
}