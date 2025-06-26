# ethereum-certificate-verifier

## Introduction
The **ethereum-certificate-verifier** project provides a decentralized, immutable, and secure system for verifying academic and professional certificates using blockchain technology. This eliminates the risks of forgery and streamlines the certificate validation process for institutions and employers.

## License
This project is open-source under the **MIT License**.

## Research Paper
This project is based on the research paper **[Blockchain-Based Certificate Verification System: A Decentralized Approach](https://www.researchgate.net/publication/382711501_Blockchain-Based_Certificate_Verification_System_A_Decentralized_Approach)**, which explores how blockchain can be utilized for secure and transparent certificate verification.

## Features
- **Decentralized Verification**: Uses blockchain to store and verify certificates.
- **Immutable Records**: Certificates are tamper-proof once added to the blockchain.
- **QR Code Authentication**: Each certificate has a QR code linked to its blockchain record.
- **User Roles**: 
  - **Admin**: Issues and revokes certificates.
  - **Student**: Requests and views their certificates.
  - **Verifier**: Validates certificate authenticity.
- **CSV Export**: Admins can export student records and certificates to CSV.
- **Email Notifications**: Sends automated emails when a certificate is issued.
- **Django Admin Panel**: Manage students, courses, and certificates via an intuitive interface.

## Technologies Used
- **Backend**: Django, Django REST Framework
- **Frontend**: React.js (or Django templates if applicable)
- **Blockchain**: Ethereum/Solidity (or Hyperledger, depending on implementation)
- **Database**: PostgreSQL / SQLite
- **Authentication**: JWT / OAuth2
- **QR Code Generation**: `qrcode` Python library
- **Email Service**: Mailjet / SMTP

## Installation & Setup

### Prerequisites
Ensure you have the following installed:
- Python (>=3.8)
- Node.js (if frontend uses React)
- PostgreSQL / SQLite
- Metamask / Ganache (for blockchain testing)

### Backend Setup
```sh
# Clone the repository
git clone https://github.com/your-repo/ethereum-certificate-verifier.git
cd ethereum-certificate-verifier

# Create a virtual environment
python -m venv venv
source venv/bin/activate  # On Windows, use `venv\Scripts\activate`

# Install dependencies
pip install -r requirements.txt

# Apply migrations
python manage.py migrate

# Create a superuser
python manage.py createsuperuser

# Run the development server
python manage.py runserver 0.0.0.0:8000
```

### Frontend Setup (If applicable)
```sh
cd frontend  # Navigate to the frontend directory
npm install  # Install dependencies
npm start    # Start the frontend development server
```

## Usage
- **Admin** logs into the Django admin panel to issue or revoke certificates.
- **Students** can log in to request and view their certificates.
- **Verifiers** can scan the QR code or enter the certificate ID to validate authenticity.

## API Endpoints (Example)
| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/certificates/` | GET | Get all certificates |
| `/api/certificates/<id>/` | GET | Get certificate details |
| `/api/certificates/issue/` | POST | Issue a new certificate |
| `/api/certificates/verify/` | POST | Verify a certificate |

## Contribution Guidelines
We welcome contributions! Follow these steps:
1. Fork the repository.
2. Create a new branch (`feature/new-feature` or `bugfix/fix-issue`).
3. Commit your changes with meaningful messages.
4. Push to your fork and submit a pull request.

## Contributors
- **Lovnish Verma** [(@lovnishVerma)](https://github.com/lovnishVerma)
- **Anita Budhiraja**
- **Dr. Sarwan Singh** [(@sarwansingh)](https://github.com/sarwansingh)

## License
This project is licensed under the **MIT License**.

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
