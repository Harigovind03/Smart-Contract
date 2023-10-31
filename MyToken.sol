// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract MyToken is ERC20Burnable{
    address public own; //state variable
    // Constructor function, executed only once during contract deployment
    constructor() ERC20("xyzERC20", "XYZ"){
        own = msg.sender;
        _mint(msg.sender, 400); // Mint 400 tokens and assign them to the contract deployer
    }
    // Function to allow burning tokens from a specific customer's address
    function burnFrom (address customer, uint amt) override public {
        _burn(customer, amt);
    }
}


