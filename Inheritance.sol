pragma solidity ^0.4.0;

interface Regulator{
    function checkValue(uint amount) external returns(bool);
    function loan() external returns(bool);

}

contract Bank{
    uint private value;
    
    constructor(uint amount) public{
        value = amount;
    }

    function deposit (uint amount) public{
        value += amount;
    }
    
    function withdraw(uint amount) public{
        if(checkValue(amount)){
            value -= amount;
        }
    }
    
    function balance() public view returns(uint){
        return value;
    }

    function checkValue(uint amount) public view returns (bool){
        return amount <= value;
    }

    function loan() public view returns (bool){
        return value > 0;
    }
}

contract MyFirstContract is Bank(100){
    string private name;
    uint private age;
    
    function setName(string newName) public{
        name = newName;
    }
    
    function getName() public view returns (string) {
        return name;
    }
    
    function setAge(uint newAge) public{
        age = newAge;
    }
    
    function getAge() public view returns(uint){
        return age;
    }

}