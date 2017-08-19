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

/// Tests of the `Ascent` type.
class AscentTests: XCTestCase {
  func createAscent(date: Date?, notes: String?) -> Ascent {
    var data = [String: Any]()

    data[BackupKey.AscentsKey.date.rawValue] = date
    data[BackupKey.AscentsKey.notes.rawValue] = notes

    return Ascent.readAscent(data: data)
  }

  /// Tests conformance to the `Equatable` protocol.
  func testAscentEquatable() {
    let now = Date()
    let note1 = "A note"
    let note2 = "Another note\n\n#2"

    // Ascents on the same date but with no notes are equal
    XCTAssertEqual(createAscent(date: now, notes: nil), createAscent(date: now, notes: nil))

    // Ascents on unknown dates with no notes are equal
    XCTAssertEqual(createAscent(date: nil, notes: nil), createAscent(date: nil, notes: nil))

    // Ascents on different dates are not equal
    XCTAssertNotEqual(createAscent(date: now, notes: nil), createAscent(date: Date.distantPast, notes: nil))

    // Ascents on the same date are not equal if their notes are not equal
    XCTAssertNotEqual(createAscent(date: now, notes: note1), createAscent(date: now, notes: nil))
    XCTAssertNotEqual(createAscent(date: now, notes: note1), createAscent(date: now, notes: note2))

    // Ascents on the unknown dates are not equal if their notes are not equal
    XCTAssertNotEqual(createAscent(date: nil, notes: note1), createAscent(date: nil, notes: nil))

    // Ascents on the same date are equal if their notes are equal
    XCTAssertEqual(createAscent(date: now, notes: note1), createAscent(date: now, notes: note1))
  }

  /// Tests that the correct property values are returned when an ascent is
  /// created without notes.
  func testAscentNowWithoutNotes() {
    let now = Date()
    let ascent = createAscent(date: now, notes: nil)

    XCTAssertEqual(ascent.date, now)
    XCTAssertNil(ascent.notes)
  }

  /// Tests that the correct property values are returned when an ascent is
  /// created with notes.
  func testAscentNowWithNote() {
    let now = Date()
    let notes = "Notes for ascent..."
    let ascent = createAscent(date: now, notes: notes)

    XCTAssertEqual(ascent.date, now)
    XCTAssertEqual(ascent.notes, notes)
  }
}
