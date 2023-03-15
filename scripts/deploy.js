// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {
  const TestMultiCall = await hre.ethers.getContractFactory("TestMultiCall");
  const test = await TestMultiCall.deploy();
  await test.deployed();

  const MultiCall = await hre.ethers.getContractFactory("MultiCall");
  const multicall = await MultiCall.deploy();

  await multicall.deployed();

  // Verify contract
  await hre.run("verify:verify", {
    address: test.address,
  });

  // Verify contract
  await hre.run("verify:verify", {
    address: multicall.address,
  });
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
