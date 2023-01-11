// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";

import {MinimalForwarder} from "@openzeppelin/contracts/metatx/MinimalForwarder.sol";
import {Registry} from "src/Registry.sol";

contract RegistryScript is Script {
  Registry registry;
  MinimalForwarder forwarder;

  function setUp() public {}

  // deploy to goerli

  function run() public {
    vm.startBroadcast();
    forwarder = new MinimalForwarder();
    registry = new Registry(forwarder);
    vm.stopBroadcast();

    vm.writeJson(
      vm.toString(address(forwarder)),
      "./app/src/deploy.json",
      ".MinimalForwarder"
    );
    vm.writeJson(
      vm.toString(address(registry)),
      "./app/src/deploy.json",
      ".Registry"
    );
  }
}
