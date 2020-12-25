pragma solidity >= 0.7.4;

import "./erc20_interface.sol";
import "./safe_math.sol";

contract brrr_token is erc20_interface {
    
    string public name;
    string public symbol;
    uint8 public decimals;
    
    uint256 total_supply;
    
    //account balances
    mapping(address => uint256) balances;
    //amount owner of an account (address 1) has approved for transfer to another account (address 2)
    mapping(address => mapping(address => uint256)) allowed;
    
    //initialize the token with a name, symbol, totalSupply
    //transfer the entire supply to the creator (msg.sender)
    constructor() {
        name = "brrr_token";
        symbol = "BRR";
        decimals = 42;
        total_supply = 42000000000000; //42 trillion tokens
        
        balances[msg.sender] = total_supply;
        emit Transfer(address(0), msg.sender, total_supply);
    }
    
    //return total supply of tokens in circulation
    //amount held in address(0) is uncirculated
    function totalSupply() external view override returns (uint256) {
        return total_supply - balances[address(0)];
    }
    
    //return balance held by tokenOwner
    function balanceOf(address tokenOwner) external view override returns (uint256 balance) {
        return balances[tokenOwner];
    }
    
    //return amount tokenOwner has allowed spender to spend (transferred to spender)
    function allowance(address tokenOwner, address spender) external view override returns (uint256 remaining) {
        return allowed[tokenOwner][spender];
    }
    
    //todo - requires SafeMath
    function transfer(address to, uint256 tokens) external override returns (bool success) {
            
    }
    
    //allow spender to spend tokens number of tokens (approve for transfer)
    function approve(address spender, uint256 tokens) external override returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }
    
    //todo - requires SafeMath
    function transferFrom(address from, address to, uint256 tokens) external override returns (bool success) {
        
    }
    
}
