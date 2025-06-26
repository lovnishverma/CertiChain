const CertificateStorage = artifacts.require("CertificateStorage");

module.exports = function (deployer) {
  deployer.deploy(CertificateStorage);
};
