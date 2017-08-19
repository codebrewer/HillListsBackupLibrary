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

/// A type representing user location data. Initially a default location in Fort
/// William is set but the user can specify a location or use their iOS device's
/// location.
public struct LocationConfiguration {
  /// Whether or not the user has chosen to use the location reported by their
  /// iOS device.
  public let useLocation: Bool

  /// The location recorded by the app.
  public let location: CLLocationCoordinate2D

  /// Creates a configuration with specified values for all properties.
  ///
  /// - Parameters:
  ///   - useLocation: whether or not to use the location set by the user or reported by their iOS device.
  ///   - latitude: the latitude of the location set by the user or reported by their iOS device.
  ///   - longitude: the longitude of the location set by the user or reported by their iOS device.
  init(useLocation: Bool, latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
    self.useLocation = useLocation
    self.location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }
}

//----------------------------------------------------------------------------//
//
// MARK: - CustomStringConvertible

extension LocationConfiguration: CustomStringConvertible {
  /// :nodoc:
  public var description: String {
    return "LocationConfiguration{useLocation: \(useLocation), location: \(location)}"
  }
}

//----------------------------------------------------------------------------//
//
// MARK: - Equatable

extension LocationConfiguration: Equatable {
  /// :nodoc:
  public static func ==(lhs: LocationConfiguration, rhs: LocationConfiguration) -> Bool {
    return lhs.useLocation == rhs.useLocation &&
            lhs.location.latitude == rhs.location.latitude &&
            lhs.location.longitude == rhs.location.longitude
  }
}
