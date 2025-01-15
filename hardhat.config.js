require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.28",
  networks: {
    coin: {
      url: "https://testnet-rpc.coinex.net",
      accounts: ["0x924b20f8ccd9aaaec2ffb39f837721a4cf84aff69bb45060642dbe381847eb0c"],
    },
  },
};
