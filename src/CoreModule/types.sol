// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

import { ResourceId } from "./ResourceId.sol";

struct SystemCallData {
  ResourceId systemId;
  bytes callData;
}

struct SystemCallFromData {
  address from;
  ResourceId systemId;
  bytes callData;
}
