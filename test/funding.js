const funding = artifacts.require("funding");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("it should calculate the rewards", function (/* accounts */) {
  it("should assert true", async function () {
    const _funding = await funding.deployed();
    await _funding._reward({
      from: "0xa0f8bAE1C6bf02f9dbF0253B0Ae1f32f03d45979",
      value: web3.utils.toWei("2.5", "ether"),
    });
    const _points_reward = await _funding._calculatedPoints();
    assert(_points_reward.toString() == "500", "rewards is not equal to 200");
  });

  it("it should return the deposit value", async function () {
    const _funding = await funding.deployed();
    const response = await _funding._deposit({
      from: "0xa0f8bAE1C6bf02f9dbF0253B0Ae1f32f03d45979",
      value: web3.utils.toWei("4", "ether"),
    });
    console.log(response);
  });
});
