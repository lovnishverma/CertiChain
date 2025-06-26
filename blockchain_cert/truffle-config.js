module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*" // Match Ganache
    }
  },
  compilers: {
    solc: {
      version: "0.5.16" // or your installed version
    }
  }
};
