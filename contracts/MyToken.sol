// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {
    // --- Step 2: Token Metadata ---
    string public name = "MyToken";       // Token name
    string public symbol = "MTK";         // Token symbol
    uint8 public decimals = 18;           // Standard decimal units
    uint256 public totalSupply;           // Total token supply

    // Mapping to track balances
    mapping(address => uint256) public balanceOf;

    // Nested mapping for allowances (owner => spender => amount)
    mapping(address => mapping(address => uint256)) public allowance;

    // --- Step 3: Events ---

    // Event emitted when tokens are transferred
    event Transfer(address indexed from, address indexed to, uint256 value);

    // Event emitted when allowance is given
    event Approval(address indexed owner, address indexed spender, uint256 value);

    // --- Constructor: Assign total supply to creator ---
    constructor(uint256 _totalSupply) {
        totalSupply = _totalSupply;             // Set total supply
        balanceOf[msg.sender] = _totalSupply;   // Give all tokens to contract creator
    }

    // --- Step 4: Transfer Function ---
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0), "Cannot transfer to zero address");
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");

        balanceOf[msg.sender] -= _value;   // Deduct from sender
        balanceOf[_to] += _value;          // Add to receiver

        emit Transfer(msg.sender, _to, _value); // Log event
        return true;
    }

    // --- Step 5: Approve Function ---
    function approve(address _spender, uint256 _value) public returns (bool success) {
        require(_spender != address(0), "Cannot approve zero address");

        allowance[msg.sender][_spender] = _value; // Set allowance

        emit Approval(msg.sender, _spender, _value); // Log event
        return true;
    }

    // --- Step 6: TransferFrom Function ---
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0), "Cannot transfer to zero address");
        require(balanceOf[_from] >= _value, "Insufficient balance");
        require(allowance[_from][msg.sender] >= _value, "Insufficient allowance");

        balanceOf[_from] -= _value;            // Subtract from owner
        balanceOf[_to] += _value;              // Add to recipient
        allowance[_from][msg.sender] -= _value; // Reduce allowance

        emit Transfer(_from, _to, _value);      // Log event
        return true;
    }

    // --- Step 7: Optional Helper Functions ---

    function getTotalSupply() public view returns (uint256) {
        return totalSupply;
    }

    function getTokenInfo()
        public
        view
        returns (string memory, string memory, uint8, uint256)
    {
        return (name, symbol, decimals, totalSupply);
    }
}