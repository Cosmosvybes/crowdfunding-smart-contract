const funding = artifacts.require("funding");

module.exports = function (_deployer) {
  _deployer.deploy(
    funding,
    "0x7C27bC27FC0a89F5E1A19D818cb5171d76c1C5a4",
    "CHURCH FOUNDATION",
    10000
  );
};
