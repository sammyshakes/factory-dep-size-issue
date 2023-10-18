// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

import { IWorldErrors } from "./IWorldErrors.sol";

import { AccessManagementSystem } from "./AccessManagementSystem.sol";
import { BalanceTransferSystem } from "./BalanceTransferSystem.sol";
import { BatchCallSystem } from "./BatchCallSystem.sol";
import { ModuleInstallationSystem } from "./ModuleInstallationSystem.sol";
import { StoreRegistrationSystem } from "./StoreRegistrationSystem.sol";
import { WorldRegistrationSystem } from "./WorldRegistrationSystem.sol";

/**
 * The CoreSystem includes all World functionality that is externalized
 * from the World contract to keep the World contract's bytecode as lean as possible.
 */
contract CoreSystem is
  IWorldErrors,
  AccessManagementSystem,
  BalanceTransferSystem,
  BatchCallSystem,
  ModuleInstallationSystem,
  StoreRegistrationSystem,
  WorldRegistrationSystem
{

}
