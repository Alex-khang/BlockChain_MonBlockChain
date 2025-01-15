require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.28",
  networks: {
    coinex: {
      url: "https://testnet-rpc.coinex.net";
      accounts: [SEPOLIA_PRIVATE_KEY],
    },
  },
};
