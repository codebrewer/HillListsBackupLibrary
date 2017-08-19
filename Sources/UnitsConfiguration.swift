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

/// A type representing the units of measurement chosen for presenting values.
public struct UnitsConfiguration {
  /// The unit of length in which distances should be presented. One of
  /// `UnitLength.miles` or `UnitLength.kilometers`.
  public let distance: UnitLength

  /// The unit of length in which heights should be presented. One of
  /// `UnitLength.feet` or `UnitLength.meters`.
  public let height: UnitLength

  /// Creates a configuration with specified values for all properties.
  ///
  /// - Parameters:
  ///   - distance: the unit of length in which distances should be presented.
  ///   - height: the unit of length in which heights should be presented.
  init(distanceUnitLength: DistanceUnitLength, heightUnitLength: HeightUnitLength) {
    self.distance = distanceUnitLength.toUnitLength()
    self.height = heightUnitLength.toUnitLength()
  }
}

//----------------------------------------------------------------------------//
//
// MARK: - CustomStringConvertible

extension UnitsConfiguration: CustomStringConvertible {
  /// :nodoc:
  public var description: String {
    return "UnitsConfiguration{distance: \(distance), height: \(height)}"
  }
}

//----------------------------------------------------------------------------//
//
// MARK: - Equatable

extension UnitsConfiguration: Equatable {
  /// :nodoc:
  public static func ==(lhs: UnitsConfiguration, rhs: UnitsConfiguration) -> Bool {
    return lhs.distance == rhs.distance && lhs.height == rhs.height
  }
}
