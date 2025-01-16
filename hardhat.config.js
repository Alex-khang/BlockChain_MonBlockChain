require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.28",
  networks: {
    coinex: {
      url: "https://testnet-rpc.coinex.net",
      accounts: [
        "0x7592c1c2bd952fa6db142f3ec757e398193caacd9e6ac2adf24f409e2f9a4dc0",
      ],
    },
  },
};
