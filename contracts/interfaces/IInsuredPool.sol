// SPDX-License-Identifier: agpl-3.0
pragma solidity ^0.8.4;

import './IInsurancePool.sol';

interface IInsuredPool is IInsurancePool {
  /// @notice Called by insurer during or after requestJoin() to inform this insured if it was accepted
  /// @param accepted true if accepted by the insurer
  function joinProcessed(bool accepted) external;

  /// @notice Invoked by chartered pools to request more coverage demand
  /// @return True if more demand can be requested
  function pullCoverageDemand() external returns (bool);

  /// @notice Get this insured params
  /// @return The insured params
  function insuredParams() external returns (InsuredParams memory);

  /// @notice Directly offer coverage to the insured
  /// @param offeredAmount The amount of coverage being offered
  /// @return acceptedAmount The amount of coverage accepted by the insured
  /// @return rate The rate that the insured is paying for the coverage
  function offerCoverage(uint256 offeredAmount) external returns (uint256 acceptedAmount, uint256 rate);
}

struct InsuredParams {
  uint24 minUnitsPerInsurer;
  uint16 riskWeightPct;
}

interface DInsuredPoolTransfer {
  function addCoverageByInvestor(
    address account,
    uint256 minAmount,
    uint256 minPremiumRate,
    address insurerPool
  ) external;
}

interface IInsuredEvents {
  // event TransferToHold(address indexed from, address indexed to, uint256 value);
  // event TransferFromHold(address indexed from, address indexed to, uint256 value);
}
