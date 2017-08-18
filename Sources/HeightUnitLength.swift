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

import Foundation

/// An enumeration of units of measurement supported for representing height.
public enum HeightUnitLength: String {
  /// Heights are represented by feet.
  case feet = "ft"

  /// Heights are represented by metres.
  case meters = "m"
}

/// Extension to `HeightUnitLength` to provide conversion methods.
extension HeightUnitLength {
  /// Returns the `UnitLength` corresponding to a `HeightUnitLength`.
  ///
  /// Using a Foundation class such as `UnitLength` in a public API makes sense.
  func toUnitLength() -> UnitLength {
    switch self {
    case .feet:
      return .feet
    case .meters:
      return .meters
    }
  }
}
