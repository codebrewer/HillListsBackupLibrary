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

/// Tests of the `ContactDetailsConfiguration` type.
class ContactsConfigurationTests: XCTestCase {
  /// Tests conformance to the `Equatable` protocol (but not exhaustively...).
  func testContactsConfigurationEquatable() {
    XCTAssertEqual(
            ContactDetailsConfiguration(exportEmailAddress: "", locationEmailAddress: "", locationSMSNumber: ""),
            ContactDetailsConfiguration(exportEmailAddress: "", locationEmailAddress: "", locationSMSNumber: ""))
    XCTAssertEqual(
            ContactDetailsConfiguration(
                    exportEmailAddress: "abc@example.com", locationEmailAddress: "def@example.com", locationSMSNumber: "1234567890"),
            ContactDetailsConfiguration(
                    exportEmailAddress: "abc@example.com", locationEmailAddress: "def@example.com", locationSMSNumber: "1234567890"))
    XCTAssertNotEqual(
            ContactDetailsConfiguration(
                    exportEmailAddress: "abc@example.com", locationEmailAddress: "def@example.com", locationSMSNumber: "1234567890"),
            ContactDetailsConfiguration(
                    exportEmailAddress: "def@example.com", locationEmailAddress: "def@example.com", locationSMSNumber: "1234567890"))
    XCTAssertNotEqual(
            ContactDetailsConfiguration(
                    exportEmailAddress: "abc@example.com", locationEmailAddress: "def@example.com", locationSMSNumber: "1234567890"),
            ContactDetailsConfiguration(
                    exportEmailAddress: "abc@example.com", locationEmailAddress: "abc@example.com", locationSMSNumber: "1234567890"))
    XCTAssertNotEqual(
            ContactDetailsConfiguration(
                    exportEmailAddress: "abc@example.com", locationEmailAddress: "def@example.com", locationSMSNumber: "1234567890"),
            ContactDetailsConfiguration(
                    exportEmailAddress: "abc@example.com", locationEmailAddress: "def@example.com", locationSMSNumber: "0987654321"))
  }
}
