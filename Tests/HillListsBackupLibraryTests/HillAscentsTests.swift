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

/// Tests of the `HillAscents` type.
class HillAscentsTests: XCTestCase {
  private func createHillAscents(hillNumbers: [String], ascentsData: [[[String: Any]]]) -> [AscendedHill] {
    guard hillNumbers.count == ascentsData.count else {
      return [AscendedHill]()
    }

    var data = [String: [[String: Any]]]()

    for i in 0..<hillNumbers.count {
      data[hillNumbers[i]] = ascentsData[i]
    }

    return AscendedHill.readAscendedHills(data: data)
  }

  private func createAscentData(date: Date?, notes: String?) -> [String: Any] {
    var data = [String: Any]()

    data[BackupKey.AscentsKey.date.rawValue] = date
    data[BackupKey.AscentsKey.notes.rawValue] = notes
    return data
  }

  func testOneHillWithoutAscents() {
    // A hill number but no ascents should return an empty array of ascents
    // (although it shouldn't be seen in practice)
    //
    XCTAssertEqual(0, createHillAscents(hillNumbers: ["H1"], ascentsData: []).count)
  }

  func testOneHillWithOneAscent() {
    let now = Date()
    let hillNumber = "H1"
    let ascentData = createAscentData(date: now, notes: nil)
    let hillAscents = createHillAscents(hillNumbers: [hillNumber], ascentsData: [[ascentData]])

    XCTAssertEqual(1, hillAscents.count)
    XCTAssertEqual(hillNumber, hillAscents[0].hillNumber)
    XCTAssertEqual(1, hillAscents[0].ascents.count)
    XCTAssertEqual(now, hillAscents[0].ascents[0].date)
    XCTAssertNil(hillAscents[0].ascents[0].notes)
  }

  func testOneHillWithTwoAscents() {
    let now = Date()
    let anHourAgo = now.addingTimeInterval(-3600.0)
    let hillNumber = "H1"
    let notes2 = "A note"
    let ascentData1 = createAscentData(date: now, notes: nil)
    let ascentData2 = createAscentData(date: anHourAgo, notes: notes2)
    let hillAscents = createHillAscents(hillNumbers: [hillNumber], ascentsData: [[ascentData1, ascentData2]])

    XCTAssertEqual(1, hillAscents.count)
    XCTAssertEqual(hillNumber, hillAscents[0].hillNumber)
    XCTAssertEqual(2, hillAscents[0].ascents.count)
    XCTAssertEqual(now, hillAscents[0].ascents[0].date)
    XCTAssertNil(hillAscents[0].ascents[0].notes)
    XCTAssertEqual(anHourAgo, hillAscents[0].ascents[1].date)
    XCTAssertEqual(notes2, hillAscents[0].ascents[1].notes)
  }

  func testTwoHillsWithDifferingNumbersOfAscents() {
    // Hill 1 with two ascents
    //
    let hill_1_Number = "H1"
    let hill_1_Ascent_1_Date = Date().addingTimeInterval(-7200.0)
    let hill_1_Ascent_1_Notes: String? = nil
    let hill_1_Ascent_1_Data = createAscentData(date: hill_1_Ascent_1_Date, notes: hill_1_Ascent_1_Notes)
    let hill_1_Ascent_2_Date = hill_1_Ascent_1_Date.addingTimeInterval(3600.0)
    let hill_1_Ascent_2_Notes = "A note"
    let hill_1_Ascent_2_Data = createAscentData(date: hill_1_Ascent_2_Date, notes: hill_1_Ascent_2_Notes)

    // Hill 2 with one ascent
    //
    let hill_2_Number = "H2"
    let hill_2_Ascent_1_Date: Date? = nil
    let hill_2_Ascent_1_Notes = "A note for H2 ascent 1"
    let hill_2_Ascent_1_Data = createAscentData(date: hill_2_Ascent_1_Date, notes: hill_2_Ascent_1_Notes)

    // Store the input data for later comparison
    //
    var inputData = [String: [(date: Date?, notes: String?)]]()

    inputData[hill_1_Number] = [(hill_1_Ascent_1_Date, hill_1_Ascent_1_Notes), (hill_1_Ascent_2_Date, hill_1_Ascent_2_Notes)]
    inputData[hill_2_Number] = [(hill_2_Ascent_1_Date, hill_2_Ascent_1_Notes)]

    // Create the `HillAscents` objects to test
    //
    let hillAscents = createHillAscents(
            hillNumbers: [hill_1_Number, hill_2_Number],
            ascentsData: [[hill_1_Ascent_1_Data, hill_1_Ascent_2_Data], [hill_2_Ascent_1_Data]])

    XCTAssertEqual(2, hillAscents.count)

    for i in 0..<hillAscents.count {
      let actualData = hillAscents[i]
      let expectedData = inputData[actualData.hillNumber]

      XCTAssertNotNil(expectedData)
      XCTAssertEqual(expectedData!.count, actualData.ascents.count)

      for j in 0..<expectedData!.count {
        XCTAssertEqual(expectedData![j].date, actualData.ascents[j].date)
        XCTAssertEqual(expectedData![j].notes, actualData.ascents[j].notes)
      }
    }
  }
}
