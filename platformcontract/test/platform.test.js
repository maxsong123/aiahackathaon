// web3 is a global variable, injected by Truffle.js
const BigNumber = web3.BigNumber

// artifacts is a global variable, injected by Truffle.js
const InsurancePlatform = artifacts.require('InsurancePlatform')

require('chai')
  .use(require('chai-as-promised'))
  .use(require('chai-bignumber')(BigNumber))
  .should()

contract('InsurancePlatform', function (walletAddresses) {
  let me = walletAddresses[0]
  let contract

  beforeEach(async function () {
    contract = await InsurancePlatform.new()
  })

  it('should create contract', async function () {
    contract.should.exist

    const shares = await contract.getShares(me)
    shares.should.be.bignumber.equal(new BigNumber(0))
  })

  it('should updateShares and getShares correctly', async function () {
    // initially i have 0 shares
    let shares = await contract.getShares(me)
    shares.should.be.bignumber.equal(new BigNumber(0))

    await contract.updateShares(1, { from: me })

    shares = await contract.getShares(me)
    shares.should.be.bignumber.equal(new BigNumber(1))
  })
})