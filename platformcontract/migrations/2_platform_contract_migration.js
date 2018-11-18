var Platform = artifacts.require('InsurancePlatform')

module.exports = function (deployer, network, accounts) {
  deployer.deploy(Platform)
}