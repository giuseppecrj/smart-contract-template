/* eslint-disable no-unused-vars */
import { ethers } from "ethers";

const MAIN_ENDPOINT = "http://127.0.0.1:8545";
const QUICKNODE_ENDPOINT = process.env.REACT_APP_QUICKNODE_URL || "";

export function createProvider() {
  console.log(`Creating provider with endpoint=${QUICKNODE_ENDPOINT}`);
  return new ethers.providers.JsonRpcProvider(
    QUICKNODE_ENDPOINT || MAIN_ENDPOINT,
  );
}
