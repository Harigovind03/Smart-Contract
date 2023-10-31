// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
//Contract Definition
contract xyz {
    //state variables
    address public company;
    address public unknown;
    ERC20Burnable public companyTokens;
    uint[] prices = [200, 400, 600]; //Array with product prices
    event Log(string message);
    mapping(address=>uint) public customerTokenBalances;  // Mapping to store customer token balances
    mapping(address => bool) paid; // Mapping to track payment status of customers
    mapping(uint => address) orders; // Mapping to store order IDs mapped to customer addresses
    mapping(uint => uint) rewards; // Mapping to store order IDs mapped to reward amounts
    mapping(uint => uint) tokenPayment; // Mapping to store order IDs mapped to token payment amounts
    uint orderid; // Variable to store order ID

    //Constructor function
    constructor( ERC20Burnable tokenAddress) {
        company = msg.sender;
        companyTokens = tokenAddress;
        orderid = 0;
    }

    // Function for customers to purchase products
    function purchase(uint idx ) public {
        require(idx>=1 && idx<=prices.length , "Enter a valid product id");
        orderid++;
        uint avTokens = getBalance(msg.sender);
        
        uint ta;

        //Calculation for discount availed
        if(avTokens >= 15){
            ta = 15;
            emit Log("You earn a 30% discount");
        }else if(avTokens >= 10){
            ta = 10;
            emit Log("You earn a 20% discount");
        }else if(avTokens >= 5){
            ta = 5;
            emit Log("You earn a 10% discount");
        }else {
            ta = 0;
            emit Log("Earn a few more coins to avail exciting discounts!!");
        }

        tokenPayment[orderid] = ta;

        orders[orderid] = msg.sender; 
        if(idx==1){
            rewards[orderid] = 2;
        }else if(idx==2){
            rewards[orderid] = 4;
        }else{
            rewards[orderid] = 6;
        }
    }
    // Function for customers to pay for their orders
    function payForOrder(uint _oid) public {

        require(orders[_oid]==msg.sender);

        emit Log("Paying...");
        paid[msg.sender] = true;
        uint tokens = tokenPayment[_oid];
        companyTokens.burnFrom(msg.sender, tokens); // Deduct the token payment amount from the customer's token balance
        customerTokenBalances[msg.sender] = customerTokenBalances[msg.sender] - tokens;
    }
    // Function for the company to confirm the order and reward the customer
    function giveConfirmation(uint _oid) public returns(uint){
        require(msg.sender==company,"Only company can give confirmation");
        address customer = orders[_oid];
        if(paid[customer]==false){
            emit Log("Please complete the payment to continue");
            return 0;
        }
        
        customerTokenBalances[customer]+=rewards[_oid];
        
        companyTokens.transferFrom(msg.sender, customer,  rewards[_oid]);
        
        paid[customer] = false;
        return 0;
    }
    // Function to get the token balance of an address
    function getBalance(address acc) public view returns(uint){
        uint a = companyTokens.balanceOf( acc);
        return a;
    }

}
