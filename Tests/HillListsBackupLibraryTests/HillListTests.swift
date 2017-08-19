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

/// Tests of the `HillList` type.
class HillListTests: XCTestCase {
  /// Tests conformance to the `Equatable` protocol (but not exhaustively...).
  func testHillListEquatable() {
    XCTAssertEqual(HillList.getHillList(id: 1), HillList.getHillList(id: 1))
    XCTAssertEqual(HillList.getHillList(id: 29), HillList.getHillList(id: 29))
    XCTAssertNotEqual(HillList.getHillList(id: 1), HillList.getHillList(id: 29))
  }

  func testInvalidListId() {
    XCTAssertNil(HillList.getHillList(id: 0))
  }

  // The following are in the order in which the lists are presented for
  // tracking selection in version 5.2 of the app.

  //
  // Lists with the Scotland flag
  //

  func testCorbettTopList() {
    let id = 2
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.corbettTop)
    XCTAssertEqual(hillList?.regions, [HillList.Region.scotland])
    XCTAssertEqual(hillList?.flag, HillList.Flag.scotland)
  }

  func testCorbettList() {
    let id = 1
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.corbett)
    XCTAssertEqual(hillList?.regions, [HillList.Region.scotland])
    XCTAssertEqual(hillList?.flag, HillList.Flag.scotland)
  }

  func testDonaldDeweyList() {
    let id = 47
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.donaldDewey)
    XCTAssertEqual(hillList?.regions, [HillList.Region.scotland])
    XCTAssertEqual(hillList?.flag, HillList.Flag.scotland)
  }

  func testDonaldTopList() {
    let id = 4
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.donaldTop)
    XCTAssertEqual(hillList?.regions, [HillList.Region.scotland])
    XCTAssertEqual(hillList?.flag, HillList.Flag.scotland)
  }

  func testDonaldList() {
    let id = 3
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.donald)
    XCTAssertEqual(hillList?.regions, [HillList.Region.scotland])
    XCTAssertEqual(hillList?.flag, HillList.Flag.scotland)
  }

  func testGrahamTopList() {
    let id = 49
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.grahamTop)
    XCTAssertEqual(hillList?.regions, [HillList.Region.scotland])
    XCTAssertEqual(hillList?.flag, HillList.Flag.scotland)
  }

  func testGrahamList() {
    let id = 5
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.graham)
    XCTAssertEqual(hillList?.regions, [HillList.Region.scotland])
    XCTAssertEqual(hillList?.flag, HillList.Flag.scotland)
  }

  func testHighlandFiveList() {
    let id = 51
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.highlandFive)
    XCTAssertEqual(hillList?.regions, [HillList.Region.scotland])
    XCTAssertEqual(hillList?.flag, HillList.Flag.scotland)
  }

  func testScottishHumpList() {
    let id = 6
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.hump)
    XCTAssertEqual(hillList?.regions, [HillList.Region.scotland])
    XCTAssertEqual(hillList?.flag, HillList.Flag.scotland)
  }

  func testScottishMarilynList() {
    let id = 7
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.marilyn)
    XCTAssertEqual(hillList?.regions, [HillList.Region.scotland])
    XCTAssertEqual(hillList?.flag, HillList.Flag.scotland)
  }

  func testMunroTopList() {
    let id = 9
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.munroTop)
    XCTAssertEqual(hillList?.regions, [HillList.Region.scotland])
    XCTAssertEqual(hillList?.flag, HillList.Flag.scotland)
  }

  func testMunroList() {
    let id = 8
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.munro)
    XCTAssertEqual(hillList?.regions, [HillList.Region.scotland])
    XCTAssertEqual(hillList?.flag, HillList.Flag.scotland)
  }

  func testMurdoList() {
    let id = 10
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.murdo)
    XCTAssertEqual(hillList?.regions, [HillList.Region.scotland])
    XCTAssertEqual(hillList?.flag, HillList.Flag.scotland)
  }

  func testNewDonaldList() {
    let id = 11
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.newDonald)
    XCTAssertEqual(hillList?.regions, [HillList.Region.scotland])
    XCTAssertEqual(hillList?.flag, HillList.Flag.scotland)
  }

  func testScottishSimmList() {
    let id = 55
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.simm)
    XCTAssertEqual(hillList?.regions, [HillList.Region.scotland])
    XCTAssertEqual(hillList?.flag, HillList.Flag.scotland)
  }

  //
  // Lists with the Isle of Man flag
  //

  func testIsleOfManHumpList() {
    let id = 13
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.hump)
    XCTAssertEqual(hillList?.regions, [HillList.Region.isleOfMan])
    XCTAssertEqual(hillList?.flag, HillList.Flag.isleOfMan)
  }

  func testIsleOfManMarilynList() {
    let id = 14
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.marilyn)
    XCTAssertEqual(hillList?.regions, [HillList.Region.isleOfMan])
    XCTAssertEqual(hillList?.flag, HillList.Flag.isleOfMan)
  }

  func testIsleOfManSimmList() {
    let id = 56
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.simm)
    XCTAssertEqual(hillList?.regions, [HillList.Region.isleOfMan])
    XCTAssertEqual(hillList?.flag, HillList.Flag.isleOfMan)
  }

  //
  // Lists with the Wales flag
  //

  func testWelshFurthList() {
    let id = 15
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.furth)
    XCTAssertEqual(hillList?.regions, [HillList.Region.wales])
    XCTAssertEqual(hillList?.flag, HillList.Flag.wales)
  }

  func testWelshHumpList() {
    let id = 18
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.hump)
    XCTAssertEqual(hillList?.regions, [HillList.Region.wales])
    XCTAssertEqual(hillList?.flag, HillList.Flag.wales)
  }

  func testWelshMarilynList() {
    let id = 19
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.marilyn)
    XCTAssertEqual(hillList?.regions, [HillList.Region.wales])
    XCTAssertEqual(hillList?.flag, HillList.Flag.wales)
  }

  func testWelshSimmList() {
    let id = 57
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.simm)
    XCTAssertEqual(hillList?.regions, [HillList.Region.wales])
    XCTAssertEqual(hillList?.flag, HillList.Flag.wales)
  }

  //
  // Lists with the England flag
  //

  func testBirkettList() {
    let id = 21
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.birkett)
    XCTAssertEqual(hillList?.regions, [HillList.Region.england])
    XCTAssertEqual(hillList?.flag, HillList.Flag.england)
  }

  func testFellrangerList() {
    let id = 58
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.fellranger)
    XCTAssertEqual(hillList?.regions, [HillList.Region.england])
    XCTAssertEqual(hillList?.flag, HillList.Flag.england)
  }

  func testEnglishFurthList() {
    let id = 48
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.furth)
    XCTAssertEqual(hillList?.regions, [HillList.Region.england])
    XCTAssertEqual(hillList?.flag, HillList.Flag.england)
  }

  func testEnglishHumpList() {
    let id = 23
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.hump)
    XCTAssertEqual(hillList?.regions, [HillList.Region.england])
    XCTAssertEqual(hillList?.flag, HillList.Flag.england)
  }

  func testLondonBoroughList() {
    let id = 62
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.londonBorough)
    XCTAssertEqual(hillList?.regions, [HillList.Region.england])
    XCTAssertEqual(hillList?.flag, HillList.Flag.england)
  }

  func testEnglishMarilynList() {
    let id = 25
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.marilyn)
    XCTAssertEqual(hillList?.regions, [HillList.Region.england])
    XCTAssertEqual(hillList?.flag, HillList.Flag.england)
  }

  func testOutlyingFellList() {
    let id = 27
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.outlyingFell)
    XCTAssertEqual(hillList?.regions, [HillList.Region.england])
    XCTAssertEqual(hillList?.flag, HillList.Flag.england)
  }

  func testEnglishSimmList() {
    let id = 59
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.simm)
    XCTAssertEqual(hillList?.regions, [HillList.Region.england])
    XCTAssertEqual(hillList?.flag, HillList.Flag.england)
  }

  func testSyngeList() {
    let id = 60
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.synge)
    XCTAssertEqual(hillList?.regions, [HillList.Region.england])
    XCTAssertEqual(hillList?.flag, HillList.Flag.england)
  }

  func testWainwrightList() {
    let id = 28
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.wainwright)
    XCTAssertEqual(hillList?.regions, [HillList.Region.england])
    XCTAssertEqual(hillList?.flag, HillList.Flag.england)
  }

  //
  // Lists with the United Kingdom flag
  //

  func testBridgeList() {
    let id = 64
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.bridge)
    XCTAssertEqual(hillList?.regions, [HillList.Region.england, .isleOfMan, .wales])
    XCTAssertEqual(hillList?.flag, HillList.Flag.unitedKingdom)
  }

  func testBuxtonAndLewiList() {
    let id = 65
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.buxtonAndLewis)
    XCTAssertEqual(hillList?.regions, [HillList.Region.england, .isleOfMan, .wales])
    XCTAssertEqual(hillList?.flag, HillList.Flag.unitedKingdom)
  }

  func testList() {
    let id = 68
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.countyTopAdministrative)
    XCTAssertEqual(hillList?.regions, [HillList.Region.england, .isleOfMan, .scotland, .wales])
    XCTAssertEqual(hillList?.flag, HillList.Flag.unitedKingdom)
  }

  func testUnitedKingdomCountyTopsCurrentList() {
    let id = 29
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.countyTopCurrent)
    XCTAssertEqual(hillList?.regions, [HillList.Region.england, .ireland, .isleOfMan, .scotland, .wales])
    XCTAssertEqual(hillList?.flag, HillList.Flag.unitedKingdom)
  }

  func testUnitedKingdomCountyTopsHistoricalList() {
    let id = 66
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.countyTopHistorical)
    XCTAssertEqual(hillList?.regions, [HillList.Region.england, .ireland, .isleOfMan, .scotland, .wales])
    XCTAssertEqual(hillList?.flag, HillList.Flag.unitedKingdom)
  }

  func testUnitedKingdomDeweyList() {
    let id = 30
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.dewey)
    XCTAssertEqual(hillList?.regions, [HillList.Region.england, .isleOfMan, .wales])
    XCTAssertEqual(hillList?.flag, HillList.Flag.unitedKingdom)
  }

  func testUnitedKingdomHewittList() {
    let id = 31
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.hewitt)
    XCTAssertEqual(hillList?.regions, [HillList.Region.england, .ireland, .wales])
    XCTAssertEqual(hillList?.flag, HillList.Flag.unitedKingdom)
  }

  func testNuttalList() {
    let id = 34
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.nuttall)
    XCTAssertEqual(hillList?.regions, [HillList.Region.england, .wales])
    XCTAssertEqual(hillList?.flag, HillList.Flag.unitedKingdom)
  }

  func testTrail100List() {
    let id = 35
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.trail100)
    XCTAssertEqual(hillList?.regions, [HillList.Region.england, .ireland, .scotland, .wales])
    XCTAssertEqual(hillList?.flag, HillList.Flag.unitedKingdom)
  }

  //
  // Lists with the Northern Ireland flag
  //

  func testArderinList() {
    let id = 39
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.arderin)
    XCTAssertEqual(hillList?.regions, [HillList.Region.ireland])
    XCTAssertEqual(hillList?.flag, HillList.Flag.northernIreland)
  }

  func testBinnionList() {
    let id = 40
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.binnion)
    XCTAssertEqual(hillList?.regions, [HillList.Region.ireland])
    XCTAssertEqual(hillList?.flag, HillList.Flag.northernIreland)
  }

  func testCarnList() {
    let id = 37
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.carn)
    XCTAssertEqual(hillList?.regions, [HillList.Region.ireland])
    XCTAssertEqual(hillList?.flag, HillList.Flag.northernIreland)
  }

  func testNorthernIrelandCountyTopsCurrentList() {
    let id = 46
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.countyTopCurrent)
    XCTAssertEqual(hillList?.regions, [HillList.Region.ireland])
    XCTAssertEqual(hillList?.flag, HillList.Flag.northernIreland)
  }

  func testNorthernIrelandCountyTopsHistoricalList() {
    let id = 67
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.countyTopHistorical)
    XCTAssertEqual(hillList?.regions, [HillList.Region.ireland])
    XCTAssertEqual(hillList?.flag, HillList.Flag.northernIreland)
  }

  func testDillonList() {
    let id = 63
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.dillon)
    XCTAssertEqual(hillList?.regions, [HillList.Region.ireland])
    XCTAssertEqual(hillList?.flag, HillList.Flag.northernIreland)
  }

  func testNorthernIrelandHewittList() {
    let id = 50
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.hewitt)
    XCTAssertEqual(hillList?.regions, [HillList.Region.ireland])
    XCTAssertEqual(hillList?.flag, HillList.Flag.northernIreland)
  }

  func testNorthernIrelandHumpList() {
    let id = 52
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.hump)
    XCTAssertEqual(hillList?.regions, [HillList.Region.ireland])
    XCTAssertEqual(hillList?.flag, HillList.Flag.northernIreland)
  }

  func testNorthernIrelandMarilynList() {
    let id = 53
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.marilyn)
    XCTAssertEqual(hillList?.regions, [HillList.Region.ireland])
    XCTAssertEqual(hillList?.flag, HillList.Flag.northernIreland)
  }

  func testMyrddynDeweyList() {
    let id = 54
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.myrddynDewey)
    XCTAssertEqual(hillList?.regions, [HillList.Region.ireland])
    XCTAssertEqual(hillList?.flag, HillList.Flag.northernIreland)
  }

  func testNorthernIrelandSimmList() {
    let id = 61
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.simm)
    XCTAssertEqual(hillList?.regions, [HillList.Region.ireland])
    XCTAssertEqual(hillList?.flag, HillList.Flag.northernIreland)
  }

  func testVandeleurLynamList() {
    let id = 41
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.vandeleurLynam)
    XCTAssertEqual(hillList?.regions, [HillList.Region.ireland])
    XCTAssertEqual(hillList?.flag, HillList.Flag.northernIreland)
  }

  //
  // Lists with the Ireland flag
  //

  func test900sList() {
    let id = 38
    let hillList = HillList.getHillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.classification, HillList.Classification.nineHundred)
    XCTAssertEqual(hillList?.regions, [HillList.Region.ireland])
    XCTAssertEqual(hillList?.flag, HillList.Flag.ireland)
  }
}
