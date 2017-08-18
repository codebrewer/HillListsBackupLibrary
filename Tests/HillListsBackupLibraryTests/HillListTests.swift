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

/// Tests of the `HillLists` type.
class HillListTests: XCTestCase {
  func testInvalidListId() {
    XCTAssertNil(HillList(id: 0))
  }

  // The following are in the order in which the lists are presented for
  // tracking selection in version 5.2 of the app.

  //
  // Scotland
  //

  func testCorbettTopsList() {
    let id = 2
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.corbettTops)
    XCTAssertEqual(hillList?.region, HillList.Region.scotland)
  }

  func testCorbettsList() {
    let id = 1
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.corbetts)
    XCTAssertEqual(hillList?.region, HillList.Region.scotland)
  }

  func testDonaldDeweysList() {
    let id = 47
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.donaldDeweys)
    XCTAssertEqual(hillList?.region, HillList.Region.scotland)
  }

  func testDonaldTopsList() {
    let id = 4
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.donaldTops)
    XCTAssertEqual(hillList?.region, HillList.Region.scotland)
  }

  func testDonaldsList() {
    let id = 3
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.donalds)
    XCTAssertEqual(hillList?.region, HillList.Region.scotland)
  }

  func testGrahamTopsList() {
    let id = 49
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.grahamTops)
    XCTAssertEqual(hillList?.region, HillList.Region.scotland)
  }

  func testGrahamsList() {
    let id = 5
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.grahams)
    XCTAssertEqual(hillList?.region, HillList.Region.scotland)
  }

  func testHighlandFivesList() {
    let id = 51
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.highlandFives)
    XCTAssertEqual(hillList?.region, HillList.Region.scotland)
  }

  func testScottishHumpsList() {
    let id = 6
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.humps)
    XCTAssertEqual(hillList?.region, HillList.Region.scotland)
  }

  func testScottishMarilynsList() {
    let id = 7
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.marilyns)
    XCTAssertEqual(hillList?.region, HillList.Region.scotland)
  }

  func testMunroTopsList() {
    let id = 9
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.munroTops)
    XCTAssertEqual(hillList?.region, HillList.Region.scotland)
  }

  func testMunrosList() {
    let id = 8
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.munros)
    XCTAssertEqual(hillList?.region, HillList.Region.scotland)
  }

  func testMurdosList() {
    let id = 10
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.murdos)
    XCTAssertEqual(hillList?.region, HillList.Region.scotland)
  }

  func testNewDonaldsList() {
    let id = 11
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.newDonalds)
    XCTAssertEqual(hillList?.region, HillList.Region.scotland)
  }

  func testScottishSimmsList() {
    let id = 55
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.simms)
    XCTAssertEqual(hillList?.region, HillList.Region.scotland)
  }

  //
  // Isle of Man
  //

  func testIsleOfManHumpsList() {
    let id = 13
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.humps)
    XCTAssertEqual(hillList?.region, HillList.Region.isleOfMan)
  }

  func testIsleOfManMarilynsList() {
    let id = 14
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.marilyns)
    XCTAssertEqual(hillList?.region, HillList.Region.isleOfMan)
  }

  func testIsleOfManSimmsList() {
    let id = 56
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.simms)
    XCTAssertEqual(hillList?.region, HillList.Region.isleOfMan)
  }

  //
  // Wales
  //

  func testWelshFurthsList() {
    let id = 15
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.furths)
    XCTAssertEqual(hillList?.region, HillList.Region.wales)
  }

  func testWelshHumpsList() {
    let id = 18
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.humps)
    XCTAssertEqual(hillList?.region, HillList.Region.wales)
  }

  func testWelshMarilynsList() {
    let id = 19
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.marilyns)
    XCTAssertEqual(hillList?.region, HillList.Region.wales)
  }

  func testWelshSimmsList() {
    let id = 57
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.simms)
    XCTAssertEqual(hillList?.region, HillList.Region.wales)
  }

  //
  // England
  //

  func testBirkettsList() {
    let id = 21
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.birketts)
    XCTAssertEqual(hillList?.region, HillList.Region.england)
  }

  func testFellrangersList() {
    let id = 58
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.fellrangers)
    XCTAssertEqual(hillList?.region, HillList.Region.england)
  }

  func testEnglishFurthsList() {
    let id = 48
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.furths)
    XCTAssertEqual(hillList?.region, HillList.Region.england)
  }

  func testEnglishHumpsList() {
    let id = 23
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.humps)
    XCTAssertEqual(hillList?.region, HillList.Region.england)
  }

  func testLondonBoroughsList() {
    let id = 62
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.londonBoroughs)
    XCTAssertEqual(hillList?.region, HillList.Region.england)
  }

  func testEnglishMarilynsList() {
    let id = 25
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.marilyns)
    XCTAssertEqual(hillList?.region, HillList.Region.england)
  }

  func testOutlyingFellsList() {
    let id = 27
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.outlyingFells)
    XCTAssertEqual(hillList?.region, HillList.Region.england)
  }

  func testEnglishSimmsList() {
    let id = 59
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.simms)
    XCTAssertEqual(hillList?.region, HillList.Region.england)
  }

  func testSyngesList() {
    let id = 60
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.synges)
    XCTAssertEqual(hillList?.region, HillList.Region.england)
  }

  func testWainwrightsList() {
    let id = 28
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.wainwrights)
    XCTAssertEqual(hillList?.region, HillList.Region.england)
  }

  //
  // United Kingdom
  //

  func testBridgesList() {
    let id = 64
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.bridges)
    XCTAssertEqual(hillList?.region, HillList.Region.unitedKingdom)
  }

  func testBuxtonAndLewisList() {
    let id = 65
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.buxtonAndLewis)
    XCTAssertEqual(hillList?.region, HillList.Region.unitedKingdom)
  }

  func testList() {
    let id = 68
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.countyTopsAdministrative)
    XCTAssertEqual(hillList?.region, HillList.Region.unitedKingdom)
  }

  func testUnitedKingdomCountyTopsCurrentList() {
    let id = 29
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.countyTopsCurrent)
    XCTAssertEqual(hillList?.region, HillList.Region.unitedKingdom)
  }

  func testUnitedKingdomCountyTopsHistoricalList() {
    let id = 66
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.countyTopsHistorical)
    XCTAssertEqual(hillList?.region, HillList.Region.unitedKingdom)
  }

  func testUnitedKingdomDeweysList() {
    let id = 30
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.deweys)
    XCTAssertEqual(hillList?.region, HillList.Region.unitedKingdom)
  }

  func testUnitedKingdomHewittsList() {
    let id = 31
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.hewitts)
    XCTAssertEqual(hillList?.region, HillList.Region.unitedKingdom)
  }

  func testNuttalsList() {
    let id = 34
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.nuttalls)
    XCTAssertEqual(hillList?.region, HillList.Region.unitedKingdom)
  }

  func testTrail100sList() {
    let id = 35
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.trail100s)
    XCTAssertEqual(hillList?.region, HillList.Region.unitedKingdom)
  }

  //
  // Northern Ireland
  //

  func testArderinsList() {
    let id = 39
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.arderins)
    XCTAssertEqual(hillList?.region, HillList.Region.northernIreland)
  }

  func testBinnionsList() {
    let id = 40
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.binnions)
    XCTAssertEqual(hillList?.region, HillList.Region.northernIreland)
  }

  func testCarnsList() {
    let id = 37
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.carns)
    XCTAssertEqual(hillList?.region, HillList.Region.northernIreland)
  }

  func testNorthernIrelandCountyTopsCurrentList() {
    let id = 46
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.countyTopsCurrent)
    XCTAssertEqual(hillList?.region, HillList.Region.northernIreland)
  }

  func testNorthernIrelandCountyTopsHistoricalList() {
    let id = 67
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.countyTopsHistorical)
    XCTAssertEqual(hillList?.region, HillList.Region.northernIreland)
  }

  func testDillonsList() {
    let id = 63
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.dillons)
    XCTAssertEqual(hillList?.region, HillList.Region.northernIreland)
  }

  func testNorthernIrelandHewittsList() {
    let id = 50
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.hewitts)
    XCTAssertEqual(hillList?.region, HillList.Region.northernIreland)
  }

  func testNorthernIrelandHumpsList() {
    let id = 52
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.humps)
    XCTAssertEqual(hillList?.region, HillList.Region.northernIreland)
  }

  func testNorthernIrelandMarilynsList() {
    let id = 53
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.marilyns)
    XCTAssertEqual(hillList?.region, HillList.Region.northernIreland)
  }

  func testMyrddynDeweysList() {
    let id = 54
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.myrddynDeweys)
    XCTAssertEqual(hillList?.region, HillList.Region.northernIreland)
  }

  func testNorthernIrelandSimmsList() {
    let id = 61
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.simms)
    XCTAssertEqual(hillList?.region, HillList.Region.northernIreland)
  }

  func testVandeleurLynamsList() {
    let id = 41
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.vandeleurLynams)
    XCTAssertEqual(hillList?.region, HillList.Region.northernIreland)
  }

  //
  // Ireland
  //

  func test900sList() {
    let id = 38
    let hillList = HillList(id: id)

    XCTAssertEqual(hillList?.id, id)
    XCTAssertEqual(hillList?.category, HillList.Category.nineHundreds)
    XCTAssertEqual(hillList?.region, HillList.Region.ireland)
  }
}
