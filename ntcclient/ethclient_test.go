// Copyright 2016 The go-ethereum Authors
// This file is part of the go-ethereum library.
//
// The go-ntc library is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// The go-ntc library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with the go-ethereum library. If not, see <http://www.gnu.org/licenses/>.

package ntcclient

import "github.com/ntc/go-ntc"

// Verify that Client implements the ntc interfaces.
var (
	_ = ntc.ChainReader(&Client{})
	_ = ntc.TransactionReader(&Client{})
	_ = ntc.ChainStateReader(&Client{})
	_ = ntc.ChainSyncReader(&Client{})
	_ = ntc.ContractCaller(&Client{})
	_ = ntc.GasEstimator(&Client{})
	_ = ntc.GasPricer(&Client{})
	_ = ntc.LogFilterer(&Client{})
	_ = ntc.PendingStateReader(&Client{})
	// _ = ntc.PendingStateEventer(&Client{})
	_ = ntc.PendingContractCaller(&Client{})
)
