// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// ERC20 standard interface definition
interface ERC20Interface {
    function totalSupply() external view returns (uint);
    function balanceOf(address tokenOwner) external view returns (uint balance);
    function allowance(
        address tokenOwner,
        address spender
    ) external view returns (uint remaining);
    function transfer(address to, uint tokens) external returns (bool success);
    function approve(
        address spender,
        uint tokens
    ) external returns (bool success);
    function transferFrom(
        address from,
        address to,
        uint tokens
    ) external returns (bool success);

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(
        address indexed tokenOwner,
        address indexed spender,
        uint tokens
    );
}

// Main token contract implementing ERC20 standard with additional features
contract Novocoin is ERC20Interface {
    string public symbol; // Token symbol
    string public name; // Token name
    uint8 public decimals; // Decimal precision
    uint public _totalSupply; // Total token supply
    uint public maxSupply = 2000000 * 10 ** 2; // Maximum supply: 2 million tokens

    address public owner; // Owner of the contract
    mapping(address => uint) balances; // Token balances by address
    mapping(address => mapping(address => uint)) allowed; // Allowances for spending on behalf of others
    mapping(address => bool) public administrators; // Admin roles

    uint public tokenPrice = 1000; // Token price in wei (1 ETH = 1000 tokens)
    bool public isPaused = false; // Pause state for token purchases

    // Events for additional actions
    event TokensPurchased(address indexed buyer, uint tokens, uint ethSpent);
    event TokenPriceUpdated(uint oldPrice, uint newPrice);
    event OwnershipTransferred(
        address indexed oldOwner,
        address indexed newOwner
    );

    modifier onlyAdmin() {
        require(administrators[msg.sender], "Caller is not an administrator");
        _;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    modifier whenNotPaused() {
        require(!isPaused, "Purchases are paused");
        _;
    }

    constructor() {
        symbol = "NOV";
        name = "Novocoin";
        decimals = 2;
        _totalSupply = 1000000 * 10 ** uint(decimals); // Initial supply: 1 million tokens
        owner = msg.sender;
        balances[owner] = _totalSupply;
        administrators[owner] = true;
        emit Transfer(address(0), owner, _totalSupply);
    }

    function setAdministrator(address admin, bool status) public onlyOwner {
        administrators[admin] = status;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "Invalid address");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }

    function totalSupply() public view override returns (uint) {
        return _totalSupply - balances[address(0)];
    }

    function balanceOf(
        address tokenOwner
    ) public view override returns (uint balance) {
        return balances[tokenOwner];
    }

    function transfer(
        address to,
        uint tokens
    ) public override returns (bool success) {
        require(balances[msg.sender] >= tokens, "Insufficient balance");
        balances[msg.sender] -= tokens;
        balances[to] += tokens;
        emit Transfer(msg.sender, to, tokens);
        return true;
    }

    function approve(
        address spender,
        uint tokens
    ) public override returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }

    function transferFrom(
        address from,
        address to,
        uint tokens
    ) public override returns (bool success) {
        require(balances[from] >= tokens, "Insufficient balance");
        require(allowed[from][msg.sender] >= tokens, "Allowance exceeded");

        balances[from] -= tokens;
        allowed[from][msg.sender] -= tokens;
        balances[to] += tokens;

        emit Transfer(from, to, tokens);
        return true;
    }

    function allowance(
        address tokenOwner,
        address spender
    ) public view override returns (uint remaining) {
        return allowed[tokenOwner][spender];
    }

    // Function to receive ETH and trigger token purchase
    receive() external payable whenNotPaused {
        buyTokens();
    }

    // Allows users to buy tokens by sending ETH
    function buyTokens() public payable whenNotPaused {
        require(msg.value > 0, "Send ETH to buy tokens");

        // Calculate number of tokens based on ETH sent and token price
        uint tokens = msg.value / tokenPrice;

        require(tokens > 0, "ETH sent is too low to buy any token");
        require(balances[owner] >= tokens, "Insufficient tokens available");

        balances[owner] -= tokens;
        balances[msg.sender] += tokens;

        emit Transfer(owner, msg.sender, tokens);
        emit TokensPurchased(msg.sender, tokens, msg.value);

        // Refund excess ETH if any (optional)
        uint totalCost = tokens * tokenPrice;
        if (msg.value > totalCost) {
            payable(msg.sender).transfer(msg.value - totalCost); // Refund excess ETH
        }
    }

    // Allows the owner to withdraw ETH from the contract
    function withdrawEther(uint amount) public onlyOwner {
        require(
            amount <= address(this).balance,
            "Insufficient contract balance"
        );

        payable(owner).transfer(amount);
    }

    // Allows administrators to update the token price
    function updateTokenPrice(uint newPrice) public onlyAdmin {
        emit TokenPriceUpdated(tokenPrice, newPrice); // Emit event before updating price
        tokenPrice = newPrice;
    }

    // Allows administrators to mint new tokens up to the maximum supply limit
    function mint(uint amount) public onlyAdmin {
        require(_totalSupply + amount <= maxSupply, "Exceeds maximum supply");

        _totalSupply += amount;
        balances[owner] += amount;

        emit Transfer(address(0), owner, amount);
    }

    // Allows users to burn their own tokens
    function burn(uint amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance to burn");

        balances[msg.sender] -= amount;
        _totalSupply -= amount;

        emit Transfer(msg.sender, address(0), amount);
    }

    // Pauses or resumes token purchases
    function pausePurchases(bool status) public onlyAdmin {
        isPaused = status;
    }

    // Returns the number of tokens available for sale (held by owner)
    function availableForSale() public view returns (uint) {
        return balances[owner];
    }

    // Returns the balance of ETH held by the contract in wei
    function contractBalance() public view returns (uint) {
        return address(this).balance;
    }
}
