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

/// A type representing a combination of backup mode and backup destination to
/// specify how backups are created and where they should be stored.
public struct BackupConfiguration {
  /// An enumeration of the ways in which backups can be made.
  public enum Mode {
    /// Backups are created automatically by the app in response to certain
    /// types of edit being made.
    case automatic

    /// Backups are made manually by the user.
    case manual
  }

  /// An enumeration of destinations for backup files.
  public enum Destination {
    /// Backups remain on the user's iOS device.
    case device

    /// Backups are stored in a Dropbox account.
    case dropbox

    /// Backups are stored in the user's iCloud account.
    case icloud

    /// The backup location is indeterminate. This is a special case defined by
    /// the library and needed because the *"Manual"* and *"Manual (Dropbox)"*
    /// configurations cannot be distinguished other than by a backup file's
    /// location at restore time.
    case indeterminate
  }

  /// This configuration's backup mode.
  public let mode: Mode

  /// This configuration's backup destination.
  public let destination: Destination

  /// Creates a backup configuration with a particular mode and destination.
  ///
  /// - Parameters:
  ///   - mode: the backup mode to use.
  ///   - destination: the destination for storing a backup.
  fileprivate init(_ mode: Mode, _ destination: Destination) {
    self.mode = mode
    self.destination = destination
  }
}

/// An extension to `BackupConfiguration` that defines constants for all of its
/// valid values, and a function to find a value from relevant backup key
/// values.
///
/// Note that once a backup has left a device there is no way to differentiate
/// between the "Manual" and "Manual (Dropbox)" backup configurations and that
/// the `manualIndeterminate` value will be used in these cases. The app
/// differentiates between "Manual" and "Manual (Dropbox)" at restore time based
/// on the location of the backup file at the time of restoration: if the file
/// is on the device the backup selection will show as "Manual" after
/// restoration; otherwise it will show as "Manual (Dropbox)".
extension BackupConfiguration {
  /// A backup configuration for automatically backing up to iCloud.
  public static let automaticIcloud = BackupConfiguration(.automatic, .icloud)

  /// A backup configuration for manually backing up to the user's device.
  public static let manualDevice = BackupConfiguration(.manual, .device)

  /// A backup configuration for manually backing up to Dropbox.
  public static let manualDropbox = BackupConfiguration(.manual, .dropbox)

  /// A backup configuration for manually backing up to iCloud.
  public static let manualIcloud = BackupConfiguration(.manual, .icloud)

  /// A manual backup configuration with an indeterminate destination.
  public static let manualIndeterminate = BackupConfiguration(.manual, .indeterminate)

  /// Returns a `BackupConfiguration` identified by relevant values from a
  /// backup or `nil` if the combination of values does not represent a
  /// supported configuration.
  ///
  /// Note that `manualIndeterminate` is returned if the selected configuration
  /// is either of "Manual" or "Manual (Dropbox)" since these cannot be
  /// differentiated once a backup has left an iOS device.
  static func getBackupConfiguration(autobackup: Bool, icloud: Bool) -> BackupConfiguration? {
    switch (autobackup, icloud) {
    case (true, true):
      return automaticIcloud
    case (false, false):
      return manualIndeterminate
    case (false, true):
      return manualIcloud
    default:
      return nil
    }
  }
}

//----------------------------------------------------------------------------//
//
// MARK: - CustomStringConvertible

extension BackupConfiguration: CustomStringConvertible {
  /// :nodoc:
  public var description: String {
    return "BackupConfiguration{mode: \(mode), destination: \(destination)}"
  }
}

//----------------------------------------------------------------------------//
//
// MARK: - Equatable

extension BackupConfiguration: Equatable {
  /// :nodoc:
  public static func ==(lhs: BackupConfiguration, rhs: BackupConfiguration) -> Bool {
    return lhs.destination == rhs.destination && lhs.mode == rhs.mode
  }
}
