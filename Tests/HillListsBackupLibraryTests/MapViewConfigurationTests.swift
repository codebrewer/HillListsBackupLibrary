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

/// Tests of the `MapViewConfiguration` type.
class MapViewConfigurationTests: XCTestCase {
  /// Tests conformance to the `Equatable` protocol (but not exhaustively...).
  func testMapViewConfigurationEquatable() {
    // We can't create arbitrary configurations but we can test the static
    // instances
    //
    XCTAssertEqual(MapViewConfiguration.appleHybrid, MapViewConfiguration.appleHybrid)
    XCTAssertNotEqual(MapViewConfiguration.appleHybrid, MapViewConfiguration.appleSatellite)
    XCTAssertNotEqual(MapViewConfiguration.appleHybrid, MapViewConfiguration.appleStandard)
    XCTAssertNotEqual(MapViewConfiguration.appleHybrid, MapViewConfiguration.googleHybrid)
    XCTAssertNotEqual(MapViewConfiguration.appleHybrid, MapViewConfiguration.googleStandard)
    XCTAssertNotEqual(MapViewConfiguration.appleHybrid, MapViewConfiguration.googleTerrain)

    XCTAssertEqual(MapViewConfiguration.appleSatellite, MapViewConfiguration.appleSatellite)
    XCTAssertNotEqual(MapViewConfiguration.appleSatellite, MapViewConfiguration.appleStandard)
    XCTAssertNotEqual(MapViewConfiguration.appleSatellite, MapViewConfiguration.googleHybrid)
    XCTAssertNotEqual(MapViewConfiguration.appleSatellite, MapViewConfiguration.googleStandard)
    XCTAssertNotEqual(MapViewConfiguration.appleSatellite, MapViewConfiguration.googleTerrain)

    XCTAssertEqual(MapViewConfiguration.appleStandard, MapViewConfiguration.appleStandard)
    XCTAssertNotEqual(MapViewConfiguration.appleStandard, MapViewConfiguration.googleHybrid)
    XCTAssertNotEqual(MapViewConfiguration.appleStandard, MapViewConfiguration.googleStandard)
    XCTAssertNotEqual(MapViewConfiguration.appleStandard, MapViewConfiguration.googleTerrain)

    XCTAssertEqual(MapViewConfiguration.googleHybrid, MapViewConfiguration.googleHybrid)
    XCTAssertNotEqual(MapViewConfiguration.googleHybrid, MapViewConfiguration.googleStandard)
    XCTAssertNotEqual(MapViewConfiguration.googleHybrid, MapViewConfiguration.googleTerrain)

    XCTAssertEqual(MapViewConfiguration.googleStandard, MapViewConfiguration.googleStandard)
    XCTAssertNotEqual(MapViewConfiguration.googleStandard, MapViewConfiguration.googleTerrain)

    XCTAssertEqual(MapViewConfiguration.googleTerrain, MapViewConfiguration.googleTerrain)
  }

  /// Tests selection of Apple Hybrid maps.
  func testAppleHybrid() {
    XCTAssertEqual(
            MapViewConfiguration.appleHybrid,
            MapViewConfiguration.getMapViewConfiguration(google: false, terrain: false, type: 2))
  }

  /// Tests selection of Apple Satellite maps.
  func testAppleSatellite() {
    XCTAssertEqual(
            MapViewConfiguration.appleSatellite,
            MapViewConfiguration.getMapViewConfiguration(google: false, terrain: false, type: 1))
  }

  /// Tests selection of Apple Standard maps.
  func testAppleStandard() {
    XCTAssertEqual(
            MapViewConfiguration.appleStandard,
            MapViewConfiguration.getMapViewConfiguration(google: false, terrain: false, type: 0))
  }

  /// Tests selection of Google Hybrid maps.
  func testGoogleHybrid() {
    XCTAssertEqual(
            MapViewConfiguration.googleHybrid,
            MapViewConfiguration.getMapViewConfiguration(google: true, terrain: false, type: 2))
  }

  /// Tests selection of Google Standard maps.
  func testGoogleStandard() {
    XCTAssertEqual(
            MapViewConfiguration.googleStandard,
            MapViewConfiguration.getMapViewConfiguration(google: true, terrain: false, type: 0))
  }

  /// Tests selection of Google Terrain maps.
  func testGoogleTerrain() {
    XCTAssertEqual(
            MapViewConfiguration.googleTerrain,
            MapViewConfiguration.getMapViewConfiguration(google: true, terrain: true, type: 0))
  }

  /// Tests various invalid permutations of configuration settings (although
  /// these shouldn't be seen in practice).
  func testSomeInvalidPermutations() {
    // Terrain mapping is only supported by Google
    XCTAssertNil(MapViewConfiguration.getMapViewConfiguration(google: false, terrain: true, type: 0))

    // `type` can only be 0, 1 or 2
    XCTAssertNil(MapViewConfiguration.getMapViewConfiguration(google: false, terrain: false, type: 3))
  }
}
