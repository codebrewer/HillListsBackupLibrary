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

/// A type that represents a backup created by the Hill Lists app and provides
/// read-only access to its data.
///
/// Properties are generally of two types:
///
/// * those that represent configuration options selected by the user on the
/// app's settings view; and
/// * those that store hill ascent-related data recorded by the user.
///
/// Additionally, there's a property that stores metadata about the backup
/// itself.
public protocol Backup {
  /// Various metadata describing properties of the backup itself.
  var metadata: Metadata { get }

  /// The hill lists being tracked, ordered according to the selected sorting
  /// configuration. Entries are not duplicated *i.e.* the property could be
  /// represented by a sorted set.
  var trackedHillLists: [HillList] { get }

  /// The hill ascents recorded in this backup. Elements appear to be in order
  /// by date of ascent, earliest first, with ascents on unknown dates sorting
  /// first. Entries are not duplicated *i.e.* the property could be represented
  /// by a sorted set.
  var ascendedHills: [AscendedHill] { get }

  /// The configuration specifying how backups should be created and where they
  /// should be stored.
  var backupConfiguration: BackupConfiguration { get }

  /// The various pieces of contact information entered by the user.
  var contactDetailsConfiguration: ContactDetailsConfiguration { get }

  /// The units of measurement configured for presentation of distances and
  /// heights.
  var unitsConfiguration: UnitsConfiguration { get }

  /// The map view configuration selected by the user.
  var mapViewConfiguration: MapViewConfiguration { get }

  /// How tracked lists should be sorted in the app's initial view and hills
  /// sorted in the view of an individual tracked list's content.
  var sortingConfigurations: SortingConfigurations { get }

  /// The last location set by the user or recorded by their iOS device, and how
  /// that location should be used.
  var locationConfiguration: LocationConfiguration { get }

  /// Miscellaneous pieces of configuration data that don't fit into or justify
  /// a more specific category.
  var miscellaneousConfiguration: MiscellaneousConfiguration { get }
}
