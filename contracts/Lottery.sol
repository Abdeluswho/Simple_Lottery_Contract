pragma solidity ^0.4.17;

contract Lottery {
 //the address of the contract creator
        address public manager;
 //players is an array of addresses
        address[] public players;
        
        
        function Lottery() public {
            manager = msg.sender;
        }
        
        function enterLottery() public payable {
            require(msg.value > .01 ether);
            players.push(msg.sender);
        }
       //generating a random number might be quite challenging with solidity 
        function random() private view returns (uint) {
         return uint(keccak256(block.difficulty, now, players));
        }
        
        function pickWinner() public restricted {
            address myaddress = this;
            uint index = random() % players.length;
            players[index].transfer(myaddress.balance);
            players = new address[](0);
        }
        
        //in this case it adds some admin access
        modifier restricted() {
            require(msg.sender == manager);
            _;
        }
        
        function getPlayers() public view returns (address[]) {
           return players;
        }
    
}