const HDWalletProvider = require('truffle-hdwallet-provider')
const Web3 = require('web3')
const { interface, bytecode } = require('./compile')

//it takes in your credential and the rinkeby API end point 
const provider = new HDWalletProvider(
    'unique birth soul hip unhappy nice reform cloth shoulder invest sentence oval',
    'https://rinkeby.infura.io/PFZQ7NzYqxYXmzUxDCZk'
);

const web3 = new Web3(provider);

const deploy = async () => {
    const accounts = await web3.eth.getAccounts()
    console.log('Accounts ', accounts[0])

const result = await new web3.eth.Contract(JSON.parse(interface))
        .deploy({ data: bytecode })
        .send({ gas: '1000000', from: accounts[0] });
    console.log('Contract deployed to ', result.options.address)
    
};

deploy()