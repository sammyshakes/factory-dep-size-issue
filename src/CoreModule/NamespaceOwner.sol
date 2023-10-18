// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "./SchemaType.sol";

// Import store internals
import { IStore } from "./IStore.sol";
import { StoreSwitch } from "./StoreSwitch.sol";
import { StoreCore } from "./StoreCore.sol";
import { Bytes } from "./Bytes.sol";
import { Memory } from "./Memory.sol";
import { SliceLib } from "./Slice.sol";
import { EncodeArray } from "./EncodeArray.sol";
import { FieldLayout, FieldLayoutLib } from "./FieldLayout.sol";
import { Schema, SchemaLib } from "./Schema.sol";
import { PackedCounter, PackedCounterLib } from "./PackedCounter.sol";
import { ResourceId } from "./ResourceId.sol";
import { RESOURCE_TABLE, RESOURCE_OFFCHAIN_TABLE } from "./storeResourceTypes.sol";

// Import user types
import { ResourceId } from "./ResourceId.sol";

ResourceId constant _tableId = ResourceId.wrap(
  bytes32(abi.encodePacked(RESOURCE_TABLE, bytes14("world"), bytes16("NamespaceOwner")))
);
ResourceId constant NamespaceOwnerTableId = _tableId;

FieldLayout constant _fieldLayout = FieldLayout.wrap(
  0x0014010014000000000000000000000000000000000000000000000000000000
);

library NamespaceOwner {
  /** Get the table values' field layout */
  function getFieldLayout() internal pure returns (FieldLayout) {
    return _fieldLayout;
  }

  /** Get the table's key schema */
  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _keySchema = new SchemaType[](1);
    _keySchema[0] = SchemaType.BYTES32;

    return SchemaLib.encode(_keySchema);
  }

  /** Get the table's value schema */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _valueSchema = new SchemaType[](1);
    _valueSchema[0] = SchemaType.ADDRESS;

    return SchemaLib.encode(_valueSchema);
  }

  /** Get the table's key names */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](1);
    keyNames[0] = "namespaceId";
  }

  /** Get the table's field names */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](1);
    fieldNames[0] = "owner";
  }

  /** Register the table with its config */
  function register() internal {
    StoreSwitch.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /** Register the table with its config */
  function _register() internal {
    StoreCore.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /** Register the table with its config (using the specified store) */
  function register(IStore _store) internal {
    _store.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /** Get owner */
  function getOwner(ResourceId namespaceId) internal view returns (address owner) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(namespaceId);

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (address(bytes20(_blob)));
  }

  /** Get owner */
  function _getOwner(ResourceId namespaceId) internal view returns (address owner) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(namespaceId);

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (address(bytes20(_blob)));
  }

  /** Get owner (using the specified store) */
  function getOwner(IStore _store, ResourceId namespaceId) internal view returns (address owner) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(namespaceId);

    bytes32 _blob = _store.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (address(bytes20(_blob)));
  }

  /** Get owner */
  function get(ResourceId namespaceId) internal view returns (address owner) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(namespaceId);

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (address(bytes20(_blob)));
  }

  /** Get owner */
  function _get(ResourceId namespaceId) internal view returns (address owner) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(namespaceId);

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (address(bytes20(_blob)));
  }

  /** Get owner (using the specified store) */
  function get(IStore _store, ResourceId namespaceId) internal view returns (address owner) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(namespaceId);

    bytes32 _blob = _store.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (address(bytes20(_blob)));
  }

  /** Set owner */
  function setOwner(ResourceId namespaceId, address owner) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(namespaceId);

    StoreSwitch.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((owner)), _fieldLayout);
  }

  /** Set owner */
  function _setOwner(ResourceId namespaceId, address owner) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(namespaceId);

    StoreCore.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((owner)), _fieldLayout);
  }

  /** Set owner (using the specified store) */
  function setOwner(IStore _store, ResourceId namespaceId, address owner) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(namespaceId);

    _store.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((owner)), _fieldLayout);
  }

  /** Set owner */
  function set(ResourceId namespaceId, address owner) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(namespaceId);

    StoreSwitch.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((owner)), _fieldLayout);
  }

  /** Set owner */
  function _set(ResourceId namespaceId, address owner) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(namespaceId);

    StoreCore.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((owner)), _fieldLayout);
  }

  /** Set owner (using the specified store) */
  function set(IStore _store, ResourceId namespaceId, address owner) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(namespaceId);

    _store.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((owner)), _fieldLayout);
  }

  /** Delete all data for given keys */
  function deleteRecord(ResourceId namespaceId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(namespaceId);

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /** Delete all data for given keys */
  function _deleteRecord(ResourceId namespaceId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(namespaceId);

    StoreCore.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /** Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, ResourceId namespaceId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(namespaceId);

    _store.deleteRecord(_tableId, _keyTuple);
  }

  /** Tightly pack static data using this table's schema */
  function encodeStatic(address owner) internal pure returns (bytes memory) {
    return abi.encodePacked(owner);
  }

  /** Tightly pack full data using this table's field layout */
  function encode(address owner) internal pure returns (bytes memory, PackedCounter, bytes memory) {
    bytes memory _staticData = encodeStatic(owner);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    return (_staticData, _encodedLengths, _dynamicData);
  }

  /** Encode keys as a bytes32 array using this table's field layout */
  function encodeKeyTuple(ResourceId namespaceId) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(namespaceId);

    return _keyTuple;
  }
}