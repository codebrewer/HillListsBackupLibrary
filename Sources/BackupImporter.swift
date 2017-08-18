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

/// A type that can generate `Backup` instances by importing backups created by
/// the Hill Lists app.
public struct BackupImporter {
  /// Creates a `Backup` instance from data in a file.
  ///
  /// - Parameter path: the path to a Hill Lists backup file.
  /// - Throws: `BackupError.openFailed`, `BackupError.initializationFailed`.
  public static func importBackup(path: String) throws -> Backup {
    guard let data = NSKeyedUnarchiver.unarchiveObject(withFile: path) as? [String: Any] else {
      throw BackupError.openFailed
    }

    return try importBackup(dictionary: data)
  }

  /// Creates a `Backup` instance from data identified by a `URL`.
  ///
  /// - Parameter url: the URL of a Hill Lists backup data source.
  /// - Throws: `BackupError.openFailed`, `BackupError.initializationFailed`.
  public static func importBackup(url: URL) throws -> Backup {
    let urlData = try Data(contentsOf: url)

    guard let data = NSKeyedUnarchiver.unarchiveObject(with: urlData) as? [String: Any] else {
      throw BackupError.openFailed
    }

    return try importBackup(dictionary: data)
  }

  /// Creates a `Backup` instance from data in a `Dictionary`, which may be
  /// convenient for processing 'backups' created other than by the Hill Lists
  /// app.
  ///
  /// - Parameter data: a dictionary containing the keys and appropriate values for a Hill Lists backup.
  /// - Throws: `BackupError.openFailed`, `BackupError.initializationFailed`.
  /// - SeeAlso:  `BackupKey`
  public static func importBackup(dictionary: [String: Any]) throws -> Backup {
    guard let backup = BackupImpl(data: dictionary) else {
      throw BackupError.initializationFailed
    }

    return backup
  }
}

/// An implementation of the `Backup` protocol that can be instantiated
/// from the `Dictionary` serialised to a Hill Lists backup file.
fileprivate class BackupImpl: Backup {
  init?(data: [String: Any]) {
    // A closure around our data to return the value for a key
    let getData = { (key: BackupKey) -> Any? in
      return data[key.rawValue]
    }

    guard let filename = getData(.filename) as? String,                    // Backup filename
          let hash = getData(.hash) as? Int,                               // Backup hash value
          let purged = getData(.purged) as? Bool,                          // Unknown purpose
          let version = getData(.version) as? Int,                         // Version information
          let restore = getData(.restore) as? [Int],                       // Unknown purpose
          let listIds = getData(.lists) as? [Int],                         // Tracked hill lists
          let ascents = getData(.ascents) as? [String: Any],               // Ascents
          let autobackup = getData(.autobackup) as? Bool,                  // Backup configuration
          let icloud = getData(.icloud) as? Bool,
          let backupConfiguration = BackupConfiguration.getBackupConfiguration(autobackup: autobackup, icloud: icloud),
          let email = getData(.email) as? String,                          // Contacts configuration
          let share = getData(.share) as? String,
          let sms = getData(.sms) as? String,
          let distance = getData(.distance) as? String,                    // Distance presentation units
          let distanceUnitLength = DistanceUnitLength(rawValue: distance),
          let height = getData(.height) as? String,                        // Height presentation units
          let heightUnitLength = HeightUnitLength(rawValue: height),
          let disclaimer = getData(.disclaimer) as? Bool,                  // Location disclaimer
          let latitude = getData(.latitude) as? CLLocationDegrees,
          let longitude = getData(.longitude) as? CLLocationDegrees,
          let google = getData(.google) as? Bool,                          // Map view configuration
          let terrain = getData(.terrain) as? Bool,
          let type = getData(.type) as? Int,
          let mapViewConfiguration =
                  MapViewConfiguration.getMapViewConfiguration(google: google, terrain: terrain, type: type),
          let sort = getData(.sort) as? Int,                               // Sorting configuration
          let hillListsContentSortingConfiguration = HillListContentSortingConfiguration(rawValue: sort),
          let multiple = getData(.multiple) as? Bool else {                // Multiple rounds
      return nil
    }

    // Sorting configuration, `percent` key is only present if lists are not sorted
    // manually
    //
    let percent = getData(.percent) as? Bool
    let hillListsSortingConfiguration = HillListsSortingConfiguration.getHillListsSortingConfiguration(percent: percent)

    // All values required to create an instance are present
    //
    self.metadata = Metadata(filename: filename, hash: hash, purged: purged, restore: restore, version: version)
    self.trackedHillLists = listIds.flatMap({ HillList(id: $0) })
    self.ascendedHills = AscendedHill.readAscendedHills(data: ascents)
    self.backupConfiguration = backupConfiguration
    self.contactDetailsConfiguration =
            ContactDetailsConfiguration(exportEmailAddress: email, locationEmailAddress: share, locationSMSNumber: sms)
    self.unitsConfiguration =
            UnitsConfiguration(distanceUnitLength: distanceUnitLength, heightUnitLength: heightUnitLength)
    self.mapViewConfiguration = mapViewConfiguration
    self.sortingConfigurations =
            SortingConfigurations(
                    hillListsSortingConfiguration: hillListsSortingConfiguration,
                    hillListContentSortingConfiguration: hillListsContentSortingConfiguration)
    self.locationConfiguration = LocationConfiguration(useLocation: disclaimer, latitude: latitude, longitude: longitude)
    self.miscellaneousConfiguration = MiscellaneousConfiguration(recordMultipleRounds: multiple)
  }

  fileprivate private(set) var metadata: Metadata
  fileprivate private(set) var trackedHillLists: [HillList]
  fileprivate private(set) var ascendedHills: [AscendedHill]
  fileprivate private(set) var backupConfiguration: BackupConfiguration
  fileprivate private(set) var contactDetailsConfiguration: ContactDetailsConfiguration
  fileprivate private(set) var unitsConfiguration: UnitsConfiguration
  fileprivate private(set) var mapViewConfiguration: MapViewConfiguration
  fileprivate private(set) var sortingConfigurations: SortingConfigurations
  fileprivate private(set) var locationConfiguration: LocationConfiguration
  fileprivate private(set) var miscellaneousConfiguration: MiscellaneousConfiguration
}
