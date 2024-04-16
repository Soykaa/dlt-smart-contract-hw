import {expect} from 'chai';
import {ethers} from "hardhat";


describe("PoetryToken", function () {
    it("Should publish poetry and retrieve it correctly", async function () {
        const poetryText = "This is my poetry";
        const PoetryToken = await ethers.getContractFactory("PoetryToken");
        const poetryToken = await PoetryToken.deploy();
        await poetryToken.publishPoetry(poetryText);
        const poetryId = await poetryToken.tokenIdCounter();
        expect(await poetryToken.getPoetryText(poetryId)).to.equal(poetryText);
    });
});

it("Should not retrieve poetry for non-existent token", async function () {
    const poetryToken = await ethers.deployContract("PoetryToken");
    await expect(poetryToken.getPoetryText(999)).to.eventually.be.rejectedWith("Token doesn't exist");
});