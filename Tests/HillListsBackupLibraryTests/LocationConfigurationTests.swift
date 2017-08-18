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

/// Tests of the `LocationConfiguration` type.
class LocationConfigurationTests: XCTestCase {
  /// Tests conformance to the `Equatable` protocol (but not exhaustively...).
  func testLocationConfigurationEquatable() {
    // Location configurations equal if all properties are equal
    XCTAssertEqual(
            LocationConfiguration(useLocation: true, latitude: 0.0, longitude: 0.0),
            LocationConfiguration(useLocation: true, latitude: 0.0, longitude: 0.0))

    // Location configurations equal if all properties are equal
    XCTAssertEqual(
            LocationConfiguration(useLocation: false, latitude: 0.0, longitude: 0.0),
            LocationConfiguration(useLocation: false, latitude: 0.0, longitude: 0.0))

    // Location configurations are not equal if one uses location but the other doesn't
    XCTAssertNotEqual(
            LocationConfiguration(useLocation: true, latitude: 0.0, longitude: 0.0),
            LocationConfiguration(useLocation: false, latitude: 0.0, longitude: 0.0))

    // Location configurations with are not equal if their latitudes differ
    XCTAssertNotEqual(
            LocationConfiguration(useLocation: true, latitude: 80.0, longitude: 180.0),
            LocationConfiguration(useLocation: true, latitude: 90.0, longitude: 180.0))

    // Location configurations with are not equal if their longitudes differ
    XCTAssertNotEqual(
            LocationConfiguration(useLocation: true, latitude: 90.0, longitude: 180.0),
            LocationConfiguration(useLocation: true, latitude: 90.0, longitude: 270.0))

    // Location configurations with are not equal if their latitudes differ
    XCTAssertNotEqual(
            LocationConfiguration(useLocation: false, latitude: 80.0, longitude: 180.0),
            LocationConfiguration(useLocation: false, latitude: 90.0, longitude: 180.0))

    // Location configurations with are not equal if their longitudes differ
    XCTAssertNotEqual(
            LocationConfiguration(useLocation: false, latitude: 90.0, longitude: 180.0),
            LocationConfiguration(useLocation: false, latitude: 90.0, longitude: 270.0))
  }
}
