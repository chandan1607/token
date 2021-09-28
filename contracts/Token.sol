pragma solidity >=0.4.22 <0.9.0;

contract Token {
    // name
    string public name = "New Token";
    //Symbol
    string public Symbol = "New Symbol";
    //standard
    string public Standard = "New Standard";
    // Constructor
    // Set the total number of tokens
    // Read the total number of tokens
    uint256 public totalSupply;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    constructor(uint256 _intialSupply) public {
        balanceOf[msg.sender] = _intialSupply;
        totalSupply = _intialSupply;
    }

    // transfer
    function transfer(address _to, uint256 _value)
        public
        returns (bool success)
    {
        require(balanceOf[msg.sender] >= _value);

        balanceOf[msg.sender] -= _value;

        balanceOf[_to] += _value;

        emit Transfer(msg.sender, _to, _value);

        return true;
    }

    // delagated transfer
    function approve(address _spender, uint256 _value)
        public
        returns (bool success)
    {
        emit Approval(msg.sender, _spender, _value);
        allowance[msg.sender][_spender] = _value;

        return true;
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) public returns (bool success) {
        //require form

        require(_value <= balanceOf[_from]);
        //require alloance
        require((_value <= allowance[_from][msg.sender]));
        // change balance
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;

        emit Transfer(_from, _to, _value);
        //update the alloance
        // tranfer event
        return true;
    }
}
