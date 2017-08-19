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

/// An enumeration of keys present in a backup.
public enum BackupKey: String {
  /// The hill ascents recorded by the user.
  ///
  /// - SeeAlso: `BackupKey.AscentsKey`
  case ascents

  /// Whether or not automatic backup is selected:
  ///
  /// * if `false` then manual backup is selected;
  /// * if `true` then automatic backup is selected.
  ///
  /// Automatic backup is triggered by various actions in the app (such as
  /// recording a new ascent) and is supported for iCloud but not Dropbox.
  ///
  /// - SeeAlso: `BackupKey.icloud`
  /// - SeeAlso: `BackupKey.root`
  case autobackup

  /// Whether or not the user has chosen to use the location reported by their
  /// iOS device and accepted a disclaimer that this should not be relied on for
  /// navigation:
  ///
  /// * if `false` then location information is not to be used;
  /// * if `true` then location information is to be used.
  ///
  /// - SeeAlso: `BackupKey.latitude`
  /// - SeeAlso: `BackupKey.longitude`
  case disclaimer

  /// The selected unit of measurement for presenting distances:
  ///
  /// * if `km` then distances are presented in kilometres;
  /// * if `mi` then distances are presented in miles.
  case distance

  /// The email address used by the app's CSV export feature.
  case email

  /// The name of the file in which the backup was originally stored on export.
  case filename

  /// A number seen to be `0` or `1`, purpose unknown. Presumably takes other
  /// values or would have a boolean.
  case filter

  /// Part of the map type selection. Indicates whether or not Google maps of
  /// some type have been selected in preference to Apple maps.
  ///
  /// - SeeAlso: `BackupKey.terrain`
  /// - SeeAlso: `BackupKey.type`
  case google

  /// A hash value, presumably unique to an individual backup and perhaps used to
  /// verify its integrity when being restored.
  case hash

  /// The selected unit of measurement for presenting heights:
  ///
  /// * if `ft` then heights are presented in feet;
  /// * if `m` then heights are presented in metres.
  case height

  /// Whether iCloud or Dropbox has been selected as the destination for
  /// backups.
  ///
  /// * if `false` then Dropbox is selected (and backups are made manually);
  /// * if `true` then iCloud is selected (and backups may be made either
  ///   automatically or manually).
  ///
  /// - SeeAlso: `BackupKey.autobackup`
  /// - SeeAlso: `BackupKey.root`
  case icloud

  /// The latitude component of the location (if any) recorded by the app's
  /// location feature.
  ///
  /// - SeeAlso: `BackupKey.disclaimer`
  case latitude

  /// The identifiers of lists tracked by the user, sorted according to the
  /// selected sorting specification.
  ///
  /// - SeeAlso: `BackupKey.percent`
  case lists

  /// The longitude component of the location (if any) recorded by the app's
  /// location feature.
  ///
  /// - SeeAlso: `BackupKey.autobackup`
  case longitude

  /// Indicates whether or not the app's feature supporting multiple rounds of
  /// ascents has been enabled:
  ///
  /// * if `false` then multiple rounds are not enabled;
  /// * if `true` then multiple rounds are enabled.
  case multiple

  /// Indicates the ordering of tracked lists on the app's initial view:
  ///
  /// * if not present then lists are ordered manually by the user;
  /// * if present and `false` then lists are sorted by name, in ascending
  /// alphabetical order;
  /// * if present and `true` then lists are sorted by percentage of hills
  /// complete, in descending order.
  ///
  /// - SeeAlso: `BackupKey.lists`
  case percent

  /// A boolean value, purpose unknown.
  case purged

  /// Purpose unknown, observed to be an array of three numbers (all -1).
  case restore

  /// Presumably indicated whether backups stored in Dropbox were saved to the
  /// root folder or to an app-specific folder. Dropbox API changes made in 2017
  /// have probably rendered this option redundant and support for saving in the
  /// root folder was removed in Hill Lists version 5.2.
  ///
  /// - SeeAlso: `BackupKey.autobackup`
  /// - SeeAlso: `BackupKey.icloud`
  case root

  /// The email address used by the app's location sharing feature.
  case share

  /// The phone number used by the app's location sharing feature.
  case sms

  /// Indicates how hills are sorted within the view of an individual list's
  /// content:
  ///
  /// * `0` - hills are sorted by section, in ascending order by number;
  /// * `1` - hills are sorted by name, in ascending alphabetical order;
  /// * `2` - hills are sorted by height, in descending order;
  /// * `3` - hills are sorted by distance from the user's recorded location, in
  /// increasing order;
  /// * `4` - hills are sorted by date of ascent, in decreasing chronological
  /// order by oldest ascent, with unknown ascent daes sorting last;
  /// * `5` - hills are sorted by number of ascents, in increasing order.
  case sort

  /// Part of the map type selection. Indicates whether or not (if Google maps
  /// are selected) the terrain map type is selected.
  ///
  /// - SeeAlso: `BackupKey.google`
  /// - SeeAlso: `BackupKey.type`
  case terrain

  /// Part of the map type selection.
  ///
  /// - SeeAlso: `BackupKey.google`
  /// - SeeAlso: `BackupKey.terrain`
  case type

  /// Presumably the version format of the backup.
  case version

  /// An enumeration of keys present in the value of the `ascents` key in a
  /// backup.
  ///
  /// - SeeAlso: `BackupKey.ascents`
  public enum AscentsKey: String {
    /// The date of the ascent.
    case date

    /// Any notes relating to the ascent.
    case notes
  }
}
