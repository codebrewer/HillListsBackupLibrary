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

/// A type representing miscellaneous app configuration values.
public struct MiscellaneousConfiguration {
  /// Whether or not to record multiple rounds of ascents.
  public let recordMultipleRounds: Bool
}

//----------------------------------------------------------------------------//
//
// MARK: - CustomStringConvertible

extension MiscellaneousConfiguration: CustomStringConvertible {
  /// :nodoc:
  public var description: String {
    return "MiscellaneousConfiguration{recordMultipleRounds: \(recordMultipleRounds)}"
  }
}

//----------------------------------------------------------------------------//
//
// MARK: - Equatable

extension MiscellaneousConfiguration: Equatable {
  /// :nodoc:
  public static func ==(lhs: MiscellaneousConfiguration, rhs: MiscellaneousConfiguration) -> Bool {
    return lhs.recordMultipleRounds == rhs.recordMultipleRounds
  }
}
