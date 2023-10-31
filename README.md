# Smart-Contract
# Blockchain Assignment -2

## Team members - (Group 4)
1) Prachi Shah (2021A7PS2589H)
2) Shramana Ghosh (2021A7PS1834H)
3) Ambi Gaur (2021A4PS2923H)
4) Harigovind R (2021A7PS2810H)

## Objective
The objective is to create a token based reward system by conceptualizing and implementing the underlying business logic and smart contracts in a sample Ethereum network.

## Problem Statement

*The porblem statement is to design  two smart contracts.
*The first contract is responsible for creating ERC20 tokens with limited supply. 
*The second contract contains the business logic, enabling customers to receive tokens upon product purchases. These tokens can be used to avail discounts on subsequent purchases, with specific discount percentages based on the token count. 
*The system must ensure validation of customer purchases, preventing fake or dummy entries. Both contracts are to be deployed exclusively by the company.
## Functions used
### MyToken.sol
```bash
  function burnFrom (address customer, uint amt) override public
```
Function to allow burning tokens from a specific customer's address(Overrides the burnFrom function in ERC20Burnable.sol
### xyz.sol
```bash
   function purchase(uint idx ) public
```
Function for customers to purchase products
```bash
   function payForOrder(uint _oid) public
```
Function for customers to pay for their orders
```bash
   function giveConfirmation(uint _oid) public returns(uint)
```
Function for the company to confirm the order and reward the customer
```bash
   function getBalance(address acc) public view returns(uint)
```
Function to get the token balance of an address  

## How to run
### Compile the contracts
Compile the given 2 files MyToken.sol and xyz.sol
### Deploy the contracts
Deploy the 2 contracts from the address chosen as the owner/Company
### Interact with contracts
Once the contracts are deployed, you can interact with them using the provided user interface in the "Deploy & Run Transactions" tab.
The address that deployed the contract can act as the Company and other addresses can be used as the customers to perform actions like purchasing and paying.
