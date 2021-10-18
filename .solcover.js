const accounts = require(`./helpers/test-wallets.js`).accounts;

module.exports = {
  client: require('ganache-cli'),
  skipFiles: [
    './mocks',
    './interfaces',
    './dependencies',
  ],
  mocha: {
    enableTimeouts: false,
  },
  providerOptions: {
    accounts,
  },
};

