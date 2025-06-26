# ethereum-certificate-verifier

📝 Truffle-Setup

# 🎓 ethereum-certificate-verifier an Blockchain Certificate Verification System

&#x20;&#x20;

This project is a Django + Ethereum-based system to store and verify student certificates on the blockchain using smart contracts, Truffle, Ganache, MetaMask, and Web3.js.

---

## 📦 Requirements

* [Node.js (LTS)](https://nodejs.org/en/download)
* Truffle
* [Ganache (GUI or CLI)](https://archive.trufflesuite.com/ganache/)
* [MetaMask (browser extension)](https://metamask.io/download)
* [Python 3.x with Django](https://www.python.org/downloads/)
* [A browser (preferably Chrome)](https://www.google.com/chrome/what-you-make-of-it/)

---

## ✅ Step 1: Install Node.js

Download and install Node.js from the official website:

🔗 [https://nodejs.org/](https://nodejs.org/)

Then verify installation:

```bash
node -v
npm -v
```

---

## ✅ Step 2: Install Truffle Globally

Install Truffle CLI using npm:

```bash
npm install -g truffle
```

Verify installation:

```bash
truffle version
```

Expected output:

```
Truffle v5.9.x
Solidity v0.8.x
Node v...
```

---

## ✅ Step 3: Initialize Truffle Project

```bash
cd C:\Users\Dell\Desktop\Blockchain
mkdir blockchain_cert && cd blockchain_cert
truffle init
```

---

## ✅ Step 4: Add the Smart Contract

Place your smart contract (e.g., CertificateStorage.sol) into the contracts/ folder.

Example: contracts/CertificateStorage.sol

---

## ✅ Step 5: Create Deployment Script

Create or modify migrations/2\_deploy\_contracts.js:

```js
const CertificateStorage = artifacts.require("CertificateStorage");

module.exports = function (deployer) {
  deployer.deploy(CertificateStorage);
};
```

---

## ✅ Step 6: Configure Truffle to Use Ganache

Edit truffle-config.js:

```js
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
      version: "0.8.20" // Match your contract version
    }
  }
};
```

---

## ✅ Step 7: Compile & Deploy the Contract

Start Ganache and then:

```bash
truffle compile
truffle migrate --network development
```

Copy the deployed contract address and ABI from:

📂 build/contracts/CertificateStorage.json

---

## 🧠 Step 8: Connect Frontend to Contract

In your Django HTML/JS frontend:

1. Paste the contract address:

```js
const contractAddress = "0xYourContractAddressFromGanache";
```

2. Paste the ABI as JSON array:

```js
const contractABI = [ /* ABI from CertificateStorage.json */ ];
```

---

## ✅ Final Step: Test Functionality

1. Connect MetaMask to your local Ganache RPC (usually [http://127.0.0.1:7545](http://127.0.0.1:7545)).
2. Use the “Write” button to store a certificate on-chain.
3. Click “Verify” to fetch and display the on-chain certificate data.

---

## 🛠 Project Structure (example)

```
blockchain_cert/
│
├── contracts/
│   └── CertificateStorage.sol
├── migrations/
│   └── 2_deploy_contracts.js
├── build/
│   └── contracts/
│       └── CertificateStorage.json
├── truffle-config.js
├── django_project/
│   └── templates/
│       └── admin.html  ← JS for interaction
├── static/
│   └── js/
│       └── web3-integration.js # optional (internal JS used)
```

---

## 🧪 Technologies Used

* 🧱 Solidity
* 🧢 Truffle
* 🌐 Web3.js
* 🥊 MetaMask
* 💠 Ganache
* 🐍 Django

---

## 📸 Screenshots

> Add screenshots in `screenshots/` directory and reference them here:

```
![Certificate List](screenshots/cert-list.png)
![Write to Blockchain](screenshots/write.png)
![Verify Result](screenshots/verify.png)
```

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

1. Fork the repository
2. Create your branch: `git checkout -b feature/your-feature`
3. Commit your changes: `git commit -m 'Add feature'`
4. Push to the branch: `git push origin feature/your-feature`
5. Submit a pull request

---

## ❓ FAQ

**Q: Why use Ganache instead of a testnet?**

> Ganache is faster and allows for local development without gas fees.

**Q: Can this be deployed to a public Ethereum network?**

> Yes, with slight modifications in `truffle-config.js` and using MetaMask’s testnet wallets.

**Q: What happens if MetaMask is not connected?**

> The frontend will prompt users to connect MetaMask to proceed.

---

Built with ❤️ using open-source tools for learning and exploration of blockchain integration with web apps.
