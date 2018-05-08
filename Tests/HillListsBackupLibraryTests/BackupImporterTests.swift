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

import CoreLocation
import Foundation
import HillListsBackupLibrary
import XCTest

/// Tests of the public API of the `BackupImporter` type.
class BackupImporterTests: XCTestCase {
  /// Returns the URL for a resource bundled with this test case.
  ///
  /// The runtime environment is taken into account since this differs between
  /// test cases run from the command line using `swift test` and test cases run
  /// from an IDE like AppCode or Xcode.
  ///
  /// - Parameters:
  ///   - forResource: the name of the resource to be found.
  ///   - withExtension: an optional resource name extension (minus any leading period).
  private func getBundledResourceURL(forResource resourceStem: String, withExtension resourceExtension: String?) -> URL? {
    if XCTestCase.isAssumedRunningFromCommandLine() {
      let resourceName: String

      if let resourceExtension = resourceExtension {
        resourceName = resourceStem.appending(".").appending(resourceExtension)
      } else {
        resourceName = resourceStem
      }

      // The Swift Package manager doesn't currently have support for bundling
      // and locating test resources so we have to resort to a bit of a hack
      // based on the observed directory structure of a project
      //
      // See feature request [SR-4725](https://bugs.swift.org/browse/SR-4725)
      //
      return NSURL.fileURL(
              withPathComponents: [
                Bundle(for: BackupImporterTests.self).bundlePath,
                "..",
                "..",
                "..",
                "..",
                "Tests",
                "HillListsBackupLibraryTests",
                "Data",
                resourceName
              ])
    } else {
      return Bundle(for: type(of: self))
              .url(forResource: resourceStem, withExtension: resourceExtension, subdirectory: "Data")
    }
  }

  //------------------------------------------------------------------------------------------------------------------//

  /// Tests that an error is thrown when trying to read from a file that (with a
  /// very degree of likelihood) doesn't exist.
  func testImportFromNonExistentFileThrows() {
    do {
      let _ = try BackupImporter.importBackup(path: "/".appending(UUID().uuidString))
    } catch BackupError.openFailed {
      return
    } catch {
      XCTFail("Unexpected error")
    }

    XCTFail("Unexpectedly successfully imported backup")
  }

  //------------------------------------------------------------------------------------------------------------------//

  /// Tests that an error is thrown if an empty dictionary (*i.e.* one that does
  /// not contain the expected keys) is opened.
  func testImportFromEmptyDictionaryThrows() {
    do {
      let _ = try BackupImporter.importBackup(dictionary: [String: Any]())
    } catch BackupError.initializationFailed {
      return
    } catch {
      print("Caught an unexpected error")

      return
    }

    XCTFail("Unexpectedly successfully imported backup from an empty dictionary")
  }

  //------------------------------------------------------------------------------------------------------------------//

  /// Tests the import of a backup created after uninstalling and re-installing
  /// the Hill Lists app on an iOS device. The app configuration in this case
  /// appears to have been reset to default values, with the exception perhaps
  /// of the configuration of backups themselves since manual backup to Dropbox
  /// was selected and the app remained linked to Dropbox (such that backups
  /// present in the linked Dropbox folder appeared in the list of available
  /// backups after reinstalling the app).
  func testImportBackup1() {
    let originalFilename = "hl20170802@215401.bak"
    let resource = "hl-test-backup1"

    guard let resourceURL = getBundledResourceURL(forResource: resource, withExtension: "bak") else {
      XCTFail("Could not load resource file")

      return
    }

    do {
      let backup = try BackupImporter.importBackup(url: resourceURL)

      // Metadata
      //
      XCTAssertEqual(originalFilename, backup.metadata.filename)
      XCTAssertEqual(4203424970, backup.metadata.hash)
      XCTAssertTrue(backup.metadata.purged)
      XCTAssertEqual([-1, -1, -1], backup.metadata.restore)
      XCTAssertEqual(430, backup.metadata.version)

      // Tracked lists
      //
      let trackedHillLists = backup.trackedHillLists

      XCTAssertEqual(5, trackedHillLists.count)

      // Munro list, Scotland flag
      //
      XCTAssertEqual(HillList.Classification.munro, trackedHillLists[0].classification)
      XCTAssertEqual([HillList.Region.scotland], trackedHillLists[0].regions)
      XCTAssertEqual(HillList.Flag.scotland, trackedHillLists[0].flag)

      // Wainwright list, England flag
      //
      XCTAssertEqual(HillList.Classification.wainwright, trackedHillLists[1].classification)
      XCTAssertEqual([HillList.Region.england], trackedHillLists[1].regions)
      XCTAssertEqual(HillList.Flag.england, trackedHillLists[1].flag)

      // Trail 100 list, UK flag
      //
      XCTAssertEqual(HillList.Classification.trail100, trackedHillLists[2].classification)
      XCTAssertEqual([HillList.Region.england, .ireland, .scotland, .wales], trackedHillLists[2].regions)
      XCTAssertEqual(HillList.Flag.unitedKingdom, trackedHillLists[2].flag)

      // Furth list, Wales flag
      //
      XCTAssertEqual(HillList.Classification.furth, trackedHillLists[3].classification)
      XCTAssertEqual([HillList.Region.wales], trackedHillLists[3].regions)
      XCTAssertEqual(HillList.Flag.wales, trackedHillLists[3].flag)

      // 900 list, Ireland flag
      //
      XCTAssertEqual(HillList.Classification.nineHundred, trackedHillLists[4].classification)
      XCTAssertEqual([HillList.Region.ireland], trackedHillLists[4].regions)
      XCTAssertEqual(HillList.Flag.ireland, trackedHillLists[4].flag)

      // Recorded ascents
      //
      XCTAssertEqual(0, backup.ascendedHills.count)

      // Backup configuration
      //
      // Note that "Manual" and "Manual (Dropbox)" can't be distinguished and
      // are both reported as "Manual - indeterminate" instead.
      //
      XCTAssertEqual(BackupConfiguration.manualIndeterminate, backup.backupConfiguration)

      // Contacts
      //
      XCTAssertEqual("", backup.contactDetailsConfiguration.exportEmailAddress)
      XCTAssertEqual("", backup.contactDetailsConfiguration.locationEmailAddress)
      XCTAssertEqual("", backup.contactDetailsConfiguration.locationSMSNumber)

      // Units
      //
      XCTAssertEqual(UnitLength.miles, backup.unitsConfiguration.distance)
      XCTAssertEqual(UnitLength.feet, backup.unitsConfiguration.height)

      // Mapping
      //
      XCTAssertEqual(MapViewConfiguration.appleStandard, backup.mapViewConfiguration)

      // Sorting
      //
      XCTAssertEqual(
              HillListsSortingConfiguration.manual,
              backup.sortingConfigurations.hillListsSortingConfiguration)
      XCTAssertEqual(
              HillListContentSortingConfiguration.section,
              backup.sortingConfigurations.hillListContentSortingConfiguration)

      // Location
      //
      XCTAssertEqual(56.817, backup.locationConfiguration.location.latitude)
      XCTAssertEqual(-5.112, backup.locationConfiguration.location.longitude)
      XCTAssertFalse(backup.locationConfiguration.useLocation)

      // Miscellaneous
      //
      XCTAssertFalse(backup.miscellaneousConfiguration.recordMultipleRounds)
    } catch let error {
      XCTFail("Caught unexpected error \(error)")
    }
  }

  //------------------------------------------------------------------------------------------------------------------//

  /// Tests the import of a backup created after changing most of the
  /// configuration settings from their default values.
  func testImportBackup2() {
    let originalFilename = "hl20170802@215415.bak"
    let resource = "hl-test-backup2"

    guard let resourceURL = getBundledResourceURL(forResource: resource, withExtension: "bak") else {
      XCTFail("Could not load resource file")

      return
    }

    do {
      let backup = try BackupImporter.importBackup(url: resourceURL)

      // Metadata
      //
      XCTAssertEqual(originalFilename, backup.metadata.filename)
      XCTAssertEqual(2429012202, backup.metadata.hash)
      XCTAssertTrue(backup.metadata.purged)
      XCTAssertEqual([-1, -1, -1], backup.metadata.restore)
      XCTAssertEqual(430, backup.metadata.version)

      // Tracked lists
      //
      let trackedHillLists = backup.trackedHillLists

      XCTAssertEqual(5, trackedHillLists.count)

      // 900 list, Ireland flag
      //
      XCTAssertEqual(HillList.Classification.nineHundred, trackedHillLists[0].classification)
      XCTAssertEqual([HillList.Region.ireland], trackedHillLists[0].regions)
      XCTAssertEqual(HillList.Flag.ireland, trackedHillLists[0].flag)

      // Furth list, Wales flag
      //
      XCTAssertEqual(HillList.Classification.furth, trackedHillLists[1].classification)
      XCTAssertEqual([HillList.Region.wales], trackedHillLists[1].regions)
      XCTAssertEqual(HillList.Flag.wales, trackedHillLists[1].flag)

      // Munro list, Scotland flag
      //
      XCTAssertEqual(HillList.Classification.munro, trackedHillLists[2].classification)
      XCTAssertEqual([HillList.Region.scotland], trackedHillLists[2].regions)
      XCTAssertEqual(HillList.Flag.scotland, trackedHillLists[2].flag)

      // Trail 100 list, UK flag
      //
      XCTAssertEqual(HillList.Classification.trail100, trackedHillLists[3].classification)
      XCTAssertEqual([HillList.Region.england, .ireland, .scotland, .wales], trackedHillLists[3].regions)
      XCTAssertEqual(HillList.Flag.unitedKingdom, trackedHillLists[3].flag)

      // Wainwright list, England flag
      //
      XCTAssertEqual(HillList.Classification.wainwright, trackedHillLists[4].classification)
      XCTAssertEqual([HillList.Region.england], trackedHillLists[4].regions)
      XCTAssertEqual(HillList.Flag.england, trackedHillLists[4].flag)

      // Recorded ascents
      //
      XCTAssertEqual(0, backup.ascendedHills.count)

      // Backup configuration
      //
      // Note that "Manual" and "Manual (Dropbox)" can't be distinguished and
      // are both reported as "Manual - indeterminate" instead.
      //
      XCTAssertEqual(BackupConfiguration.manualIndeterminate, backup.backupConfiguration)

      // Contacts
      //
      XCTAssertEqual("export@example.com", backup.contactDetailsConfiguration.exportEmailAddress)
      XCTAssertEqual("location@example.com", backup.contactDetailsConfiguration.locationEmailAddress)
      XCTAssertEqual("1234567890", backup.contactDetailsConfiguration.locationSMSNumber)

      // Units
      //
      XCTAssertEqual(UnitLength.kilometers, backup.unitsConfiguration.distance)
      XCTAssertEqual(UnitLength.meters, backup.unitsConfiguration.height)

      // Mapping
      //
      XCTAssertEqual(MapViewConfiguration.googleStandard, backup.mapViewConfiguration)

      // Sorting
      //
      XCTAssertEqual(
              HillListsSortingConfiguration.nameAscending,
              backup.sortingConfigurations.hillListsSortingConfiguration)
      XCTAssertEqual(
              HillListContentSortingConfiguration.section,
              backup.sortingConfigurations.hillListContentSortingConfiguration)

      // Location
      //
      XCTAssertEqual(56.817, backup.locationConfiguration.location.latitude)
      XCTAssertEqual(-5.112, backup.locationConfiguration.location.longitude)
      XCTAssertTrue(backup.locationConfiguration.useLocation)

      // Miscellaneous
      //
      XCTAssertFalse(backup.miscellaneousConfiguration.recordMultipleRounds)
    } catch let error {
      XCTFail("Caught unexpected error \(error)")
    }
  }

  //------------------------------------------------------------------------------------------------------------------//

  /// Tests the import of a backup containing a single ascent of each of the
  /// three highest hills in each of Scotland, Wales, Ireland and England. None
  /// of the ascents has any associated notes but each has a non-`nil` date.
  func testImportBackup3() {
    let originalFilename = "hl20170802@215430.bak"
    let resource = "hl-test-backup3"

    guard let resourceURL = getBundledResourceURL(forResource: resource, withExtension: "bak") else {
      XCTFail("Could not load resource file")

      return
    }

    do {
      let backup = try BackupImporter.importBackup(url: resourceURL)

      // Metadata
      //
      XCTAssertEqual(originalFilename, backup.metadata.filename)
      XCTAssertEqual(2839233567, backup.metadata.hash)
      XCTAssertTrue(backup.metadata.purged)
      XCTAssertEqual([-1, -1, -1], backup.metadata.restore)
      XCTAssertEqual(430, backup.metadata.version)

      // Tracked lists
      //
      let trackedHillLists = backup.trackedHillLists

      XCTAssertEqual(8, trackedHillLists.count)

      // 900 list, Ireland flag
      //
      XCTAssertEqual(HillList.Classification.nineHundred, trackedHillLists[0].classification)
      XCTAssertEqual([HillList.Region.ireland], trackedHillLists[0].regions)
      XCTAssertEqual(HillList.Flag.ireland, trackedHillLists[0].flag)

      // Corbett list, Scotland flag
      //
      XCTAssertEqual(HillList.Classification.corbett, trackedHillLists[1].classification)
      XCTAssertEqual([HillList.Region.scotland], trackedHillLists[1].regions)
      XCTAssertEqual(HillList.Flag.scotland, trackedHillLists[1].flag)

      // Furth list, Wales flag
      //
      XCTAssertEqual(HillList.Classification.furth, trackedHillLists[2].classification)
      XCTAssertEqual([HillList.Region.wales], trackedHillLists[2].regions)
      XCTAssertEqual(HillList.Flag.wales, trackedHillLists[2].flag)

      // Marilyn list, Wales flag
      //
      XCTAssertEqual(HillList.Classification.marilyn, trackedHillLists[3].classification)
      XCTAssertEqual([HillList.Region.wales], trackedHillLists[3].regions)
      XCTAssertEqual(HillList.Flag.wales, trackedHillLists[3].flag)

      // Marilyn list, England flag
      //
      XCTAssertEqual(HillList.Classification.marilyn, trackedHillLists[4].classification)
      XCTAssertEqual([HillList.Region.england], trackedHillLists[4].regions)
      XCTAssertEqual(HillList.Flag.england, trackedHillLists[4].flag)

      // Munro list, Scotland flag
      //
      XCTAssertEqual(HillList.Classification.munro, trackedHillLists[5].classification)
      XCTAssertEqual([HillList.Region.scotland], trackedHillLists[5].regions)
      XCTAssertEqual(HillList.Flag.scotland, trackedHillLists[5].flag)

      // Trail 100 list, UK flag
      //
      XCTAssertEqual(HillList.Classification.trail100, trackedHillLists[6].classification)
      XCTAssertEqual([HillList.Region.england, .ireland, .scotland, .wales], trackedHillLists[6].regions)
      XCTAssertEqual(HillList.Flag.unitedKingdom, trackedHillLists[6].flag)

      // Wainwright list, England flag
      //
      XCTAssertEqual(HillList.Classification.wainwright, trackedHillLists[7].classification)
      XCTAssertEqual([HillList.Region.england], trackedHillLists[7].regions)
      XCTAssertEqual(HillList.Flag.england, trackedHillLists[7].flag)

      // Recorded ascents
      //
      XCTAssertEqual(12, backup.ascendedHills.count)

      let expectedHillNumbers = ["H278", "H518", "H519", "H1963", "H1964", "H1965", "H2359", "H2360", "H2515", "H20001", "H20002", "H20003"]
      let actualHillNumbers = backup.ascendedHills.map { ascendedHill -> String in
        return ascendedHill.hillNumber
      }

      XCTAssertEqual(12, actualHillNumbers.count)
      XCTAssertEqual(Set(expectedHillNumbers), Set(actualHillNumbers))
      backup.ascendedHills.forEach { ascendedHill in
        XCTAssertEqual(1, ascendedHill.ascents.count)
      }
      backup.ascendedHills.forEach { ascendedHill in
        XCTAssertNil(ascendedHill.ascents[0].notes)
      }

      let dateFormatter = DateFormatter()

      dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"

      let beforeEarliestAscentDate = dateFormatter.date(from: "2017-08-02 17:22:00 +0000")
      let afterLatestAscentDate = dateFormatter.date(from: "2017-08-02 17:25:00 +0000")

      backup.ascendedHills.forEach { ascendedHill in
        XCTAssertTrue(ascendedHill.ascents[0].date! > beforeEarliestAscentDate!)
        XCTAssertTrue(ascendedHill.ascents[0].date! < afterLatestAscentDate!)
      }

      // Backup configuration
      //
      // Note that "Manual" and "Manual (Dropbox)" can't be distinguished and
      // are both reported as "Manual - indeterminate" instead.
      //
      XCTAssertEqual(BackupConfiguration.manualIndeterminate, backup.backupConfiguration)

      // Contacts
      //
      XCTAssertEqual("export@example.com", backup.contactDetailsConfiguration.exportEmailAddress)
      XCTAssertEqual("location@example.com", backup.contactDetailsConfiguration.locationEmailAddress)
      XCTAssertEqual("1234567890", backup.contactDetailsConfiguration.locationSMSNumber)

      // Units
      //
      XCTAssertEqual(UnitLength.kilometers, backup.unitsConfiguration.distance)
      XCTAssertEqual(UnitLength.meters, backup.unitsConfiguration.height)

      // Mapping
      //
      XCTAssertEqual(MapViewConfiguration.googleTerrain, backup.mapViewConfiguration)

      // Sorting
      //
      XCTAssertEqual(
              HillListsSortingConfiguration.nameAscending,
              backup.sortingConfigurations.hillListsSortingConfiguration)
      XCTAssertEqual(
              HillListContentSortingConfiguration.section,
              backup.sortingConfigurations.hillListContentSortingConfiguration)

      // Location
      //
      XCTAssertEqual(56.817, backup.locationConfiguration.location.latitude)
      XCTAssertEqual(-5.112, backup.locationConfiguration.location.longitude)
      XCTAssertTrue(backup.locationConfiguration.useLocation)

      // Miscellaneous
      //
      XCTAssertFalse(backup.miscellaneousConfiguration.recordMultipleRounds)
    } catch let error {
      XCTFail("Caught unexpected error \(error)")
    }
  }

  //------------------------------------------------------------------------------------------------------------------//

  /// Tests the import of a backup containing three ascents of Ben Nevis. Each
  /// ascent has an associated note but only two have non-`nil` dates.
  func testImportBackup4() {
    let originalFilename = "hl20170802@215442.bak"
    let resource = "hl-test-backup4"

    guard let resourceURL = getBundledResourceURL(forResource: resource, withExtension: "bak") else {
      XCTFail("Could not load resource file")

      return
    }

    do {
      let backup = try BackupImporter.importBackup(url: resourceURL)

      // Metadata
      //
      XCTAssertEqual(originalFilename, backup.metadata.filename)
      XCTAssertEqual(2442544822, backup.metadata.hash)
      XCTAssertTrue(backup.metadata.purged)
      XCTAssertEqual([-1, -1, -1], backup.metadata.restore)
      XCTAssertEqual(430, backup.metadata.version)

      // Tracked lists
      //
      let trackedHillLists = backup.trackedHillLists

      XCTAssertEqual(8, trackedHillLists.count)

      // 900 list, Ireland flag
      //
      XCTAssertEqual(HillList.Classification.nineHundred, trackedHillLists[0].classification)
      XCTAssertEqual([HillList.Region.ireland], trackedHillLists[0].regions)
      XCTAssertEqual(HillList.Flag.ireland, trackedHillLists[0].flag)

      // Corbett list, Scotland flag
      //
      XCTAssertEqual(HillList.Classification.corbett, trackedHillLists[1].classification)
      XCTAssertEqual([HillList.Region.scotland], trackedHillLists[1].regions)
      XCTAssertEqual(HillList.Flag.scotland, trackedHillLists[1].flag)

      // Furth list, Wales flag
      //
      XCTAssertEqual(HillList.Classification.furth, trackedHillLists[2].classification)
      XCTAssertEqual([HillList.Region.wales], trackedHillLists[2].regions)
      XCTAssertEqual(HillList.Flag.wales, trackedHillLists[2].flag)

      // Marilyn list, Wales flag
      //
      XCTAssertEqual(HillList.Classification.marilyn, trackedHillLists[3].classification)
      XCTAssertEqual([HillList.Region.wales], trackedHillLists[3].regions)
      XCTAssertEqual(HillList.Flag.wales, trackedHillLists[3].flag)

      // Marilyn list, England flag
      //
      XCTAssertEqual(HillList.Classification.marilyn, trackedHillLists[4].classification)
      XCTAssertEqual([HillList.Region.england], trackedHillLists[4].regions)
      XCTAssertEqual(HillList.Flag.england, trackedHillLists[4].flag)

      // Munro list, Scotland flag
      //
      XCTAssertEqual(HillList.Classification.munro, trackedHillLists[5].classification)
      XCTAssertEqual([HillList.Region.scotland], trackedHillLists[5].regions)
      XCTAssertEqual(HillList.Flag.scotland, trackedHillLists[5].flag)

      // Trail 100 list, UK flag
      //
      XCTAssertEqual(HillList.Classification.trail100, trackedHillLists[6].classification)
      XCTAssertEqual([HillList.Region.england, .ireland, .scotland, .wales], trackedHillLists[6].regions)
      XCTAssertEqual(HillList.Flag.unitedKingdom, trackedHillLists[6].flag)

      // Wainwright list, England flag
      //
      XCTAssertEqual(HillList.Classification.wainwright, trackedHillLists[7].classification)
      XCTAssertEqual([HillList.Region.england], trackedHillLists[7].regions)
      XCTAssertEqual(HillList.Flag.england, trackedHillLists[7].flag)

      // Recorded ascents
      //
      XCTAssertEqual(1, backup.ascendedHills.count)

      let benNevis = backup.ascendedHills[0]

      XCTAssertEqual(3, benNevis.ascents.count)
      XCTAssertEqual("H278", benNevis.hillNumber)

      let benNevisAscent1 = benNevis.ascents[0]
      let benNevisAscent2 = benNevis.ascents[1]
      let benNevisAscent3 = benNevis.ascents[2]

      XCTAssertNil(benNevisAscent1.date)
      XCTAssertNotNil(benNevisAscent2.date)
      XCTAssertNotNil(benNevisAscent3.date)
      benNevis.ascents.forEach { hillAscent in
        XCTAssertNotNil(hillAscent.notes)
      }
      XCTAssertEqual("Third ascent of Ben Nevis", benNevisAscent1.notes!)
      XCTAssertEqual("First ascent of Ben Nevis", benNevisAscent2.notes!)
      XCTAssertEqual("Second ascent of Ben Nevis", benNevisAscent3.notes!)

      let calendar = Calendar.current

      XCTAssertEqual(2000, calendar.component(.year, from: benNevisAscent2.date!))
      XCTAssertEqual(7, calendar.component(.month, from: benNevisAscent2.date!))
      XCTAssertEqual(1, calendar.component(.day, from: benNevisAscent2.date!))
      XCTAssertEqual(2008, calendar.component(.year, from: benNevisAscent3.date!))
      XCTAssertEqual(7, calendar.component(.month, from: benNevisAscent3.date!))
      XCTAssertEqual(1, calendar.component(.day, from: benNevisAscent3.date!))

      // Backup configuration
      //
      // Note that "Manual" and "Manual (Dropbox)" can't be distinguished and
      // are both reported as "Manual - indeterminate" instead.
      //
      XCTAssertEqual(BackupConfiguration.manualIndeterminate, backup.backupConfiguration)

      // Contacts
      //
      XCTAssertEqual("export@example.com", backup.contactDetailsConfiguration.exportEmailAddress)
      XCTAssertEqual("location@example.com", backup.contactDetailsConfiguration.locationEmailAddress)
      XCTAssertEqual("1234567890", backup.contactDetailsConfiguration.locationSMSNumber)

      // Units
      //
      XCTAssertEqual(UnitLength.kilometers, backup.unitsConfiguration.distance)
      XCTAssertEqual(UnitLength.meters, backup.unitsConfiguration.height)

      // Mapping
      //
      XCTAssertEqual(MapViewConfiguration.googleTerrain, backup.mapViewConfiguration)

      // Sorting
      //
      XCTAssertEqual(
              HillListsSortingConfiguration.nameAscending,
              backup.sortingConfigurations.hillListsSortingConfiguration)
      XCTAssertEqual(
              HillListContentSortingConfiguration.section,
              backup.sortingConfigurations.hillListContentSortingConfiguration)

      // Location
      //
      XCTAssertEqual(56.817, backup.locationConfiguration.location.latitude)
      XCTAssertEqual(-5.112, backup.locationConfiguration.location.longitude)
      XCTAssertTrue(backup.locationConfiguration.useLocation)

      // Miscellaneous
      //
      XCTAssertFalse(backup.miscellaneousConfiguration.recordMultipleRounds)
    } catch let error {
      XCTFail("Caught unexpected error \(error)")
    }
  }
}

//--------------------------------------------------------------------------------------------------------------------//

extension XCTestCase {
  /// Guesses whether or not test cases are being run from the command line.
  static func isAssumedRunningFromCommandLine() -> Bool {
    // This environment variable (among others) is seen when test cases are run
    // from an IDE like Xcode or AppCode but not when run from from the command
    // line using `swift test`. Perhaps there's a better way to differentiate...
    //
    return ProcessInfo.processInfo.environment["DYLD_FRAMEWORK_PATH"] == nil
  }
}
