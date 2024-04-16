require('dotenv').config();
require("@nomicfoundation/hardhat-toolbox")
require("@nomiclabs/hardhat-ethers");

const { API_URL, PRIVATE_KEY } = process.env;

module.exports = {
   solidity: "0.8.20",
   defaultNetwork: "sepolia",
   networks: {
      hardhat: {},
      sepolia: {
         url: API_URL,
         accounts: [`0x${PRIVATE_KEY}`]
      }
   },
   etherscan: {
    apiKey: "V1MRMYHMWW7VJEZQZ3J5AGBPPMA6YXBF1V",
  },
}