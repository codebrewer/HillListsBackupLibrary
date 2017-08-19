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

/// A type representing a set of contact details used for sharing data from the
/// app.
public struct ContactDetailsConfiguration {
  /// The address used when exporting data in CSV format by email.
  public let exportEmailAddress: String

  /// The address used when sharing location information by email.
  public let locationEmailAddress: String

  /// The phone number used when sharing location information by SMS.
  public let locationSMSNumber: String
}

//----------------------------------------------------------------------------//
//
// MARK: - CustomStringConvertible

extension ContactDetailsConfiguration: CustomStringConvertible {
  /// :nodoc:
  public var description: String {
    return "ContactDetailsConfiguration{" +
            "exportEmailAddress: \(exportEmailAddress), " +
            "locationEmailAddress: \(locationEmailAddress), " +
            "locationSMSNumber: \(locationSMSNumber)" +
            "}"
  }
}

//----------------------------------------------------------------------------//
//
// MARK: - Equatable

extension ContactDetailsConfiguration: Equatable {
  /// :nodoc:
  public static func ==(lhs: ContactDetailsConfiguration, rhs: ContactDetailsConfiguration) -> Bool {
    return lhs.exportEmailAddress == rhs.exportEmailAddress &&
            lhs.locationEmailAddress == rhs.locationEmailAddress &&
            lhs.locationSMSNumber == rhs.locationSMSNumber
  }
}
