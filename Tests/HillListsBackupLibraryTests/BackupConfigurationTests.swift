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

/// Tests of the `BackupConfiguration` type.
class BackupConfigurationTests: XCTestCase {
  /// Tests conformance to the `Equatable` protocol (but not exhaustively...).
  func testBackupConfigurationEquatable() {
    XCTAssertEqual(
            BackupConfiguration.getBackupConfiguration(autobackup: false, icloud: false),
            BackupConfiguration.getBackupConfiguration(autobackup: false, icloud: false))
    XCTAssertEqual(
            BackupConfiguration.getBackupConfiguration(autobackup: true, icloud: false),
            BackupConfiguration.getBackupConfiguration(autobackup: true, icloud: false))
    XCTAssertEqual(
            BackupConfiguration.getBackupConfiguration(autobackup: false, icloud: true),
            BackupConfiguration.getBackupConfiguration(autobackup: false, icloud: true))
    XCTAssertEqual(
            BackupConfiguration.getBackupConfiguration(autobackup: true, icloud: true),
            BackupConfiguration.getBackupConfiguration(autobackup: true, icloud: true))
    XCTAssertNotEqual(
            BackupConfiguration.getBackupConfiguration(autobackup: true, icloud: true),
            BackupConfiguration.getBackupConfiguration(autobackup: false, icloud: true))
    XCTAssertNotEqual(
            BackupConfiguration.getBackupConfiguration(autobackup: true, icloud: false),
            BackupConfiguration.getBackupConfiguration(autobackup: true, icloud: true))
  }

  /// Tests manual backup to destinations other than iCloud.
  func testManualIndeterminate() {
    XCTAssertEqual(
            BackupConfiguration.getBackupConfiguration(autobackup: false, icloud: false),
            BackupConfiguration.manualIndeterminate)
  }

  /// Tests manual backup to iCloud.
  func testManualIcloud() {
    XCTAssertEqual(
            BackupConfiguration.getBackupConfiguration(autobackup: false, icloud: true),
            BackupConfiguration.manualIcloud)
  }

  /// Tests automatic backup to iCloud.
  func testAutomaticIcloud() {
    XCTAssertEqual(
            BackupConfiguration.getBackupConfiguration(autobackup: true, icloud: true),
            BackupConfiguration.automaticIcloud)
  }

  /// Tests automatic backup to destinations other than iCloud is invalid.
  func testInvalidPermutation() {
    // Automatic backup is only supported for iCloud
    XCTAssertNil(BackupConfiguration.getBackupConfiguration(autobackup: true, icloud: false))
  }
}
