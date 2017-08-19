//----------------------------------------------------------------------------//
//
// Copyright 2017 Mark Scott
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
//----------------------------------------------------------------------------//

@testable import HillListsBackupLibrary
import XCTest

/// Tests of the `HillListsSortingConfiguration` type.
class HillListsSortingConfigurationTests: XCTestCase {
  /// Tests selection of manual sorting.
  func testManualSorting() {
    XCTAssertEqual(
            HillListsSortingConfiguration.manual,
            HillListsSortingConfiguration.getHillListsSortingConfiguration(percent: nil))
  }

  /// Tests selection of 'name ascending' sorting.
  func testNameAscendingSorting() {
    XCTAssertEqual(
            HillListsSortingConfiguration.nameAscending,
            HillListsSortingConfiguration.getHillListsSortingConfiguration(percent: false))
  }

  /// Tests selection of 'percentage complete descending' sorting.
  func testPercentageCompleteDescending() {
    XCTAssertEqual(
            HillListsSortingConfiguration.percentageCompleteDescending,
            HillListsSortingConfiguration.getHillListsSortingConfiguration(percent: true))
  }
}
