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

/// A type representing backup metadata.
public struct Metadata {
  /// The name of the file in which the backup was originally stored on export.
  /// The app uses a naming convention that includes the date and time at which
  /// the backup was created: *hl&lt;date&gt;@&lt;time&gt;.bak*.
  public let filename: String

  /// The value stored in the backup against the `hash` key. Observed to be
  /// unique for every backup and presumably used to verify integrity on
  /// restore.
  public let hash: Int

  /// The value stored in the backup against the `purged` key. Purpose unknown.
  public let purged: Bool

  /// The value stored in the backup against the `restore` key. Purpose unknown.
  public let restore: [Int]

  /// The value stored in the backup against the `version` key. Presumably
  /// indicates the data format of the backup, perhaps for a compatibility check
  /// on restore.
  public let version: Int
}

//----------------------------------------------------------------------------//
//
// MARK: - CustomStringConvertible

extension Metadata: CustomStringConvertible {
  /// :nodoc:
  public var description: String {
    return "Metadata{filename: \(filename), hash: \(hash), purged: \(purged), restore: \(restore), version: \(version)}"
  }
}

//----------------------------------------------------------------------------//
//
// MARK: - Equatable

extension Metadata: Equatable {
  /// :nodoc:
  public static func ==(lhs: Metadata, rhs: Metadata) -> Bool {
    return lhs.filename == rhs.filename &&
            lhs.hash == rhs.hash &&
            lhs.purged == rhs.purged &&
            lhs.restore == rhs.restore &&
            lhs.version == rhs.version
  }
}
