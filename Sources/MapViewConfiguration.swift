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

/// A type representing a combination of map vendor and map style to specify a
/// mapping implementation for use in map-based views.
public struct MapViewConfiguration {
  /// An enumeration of map vendors.
  public enum Vendor {
    /// Apple Maps
    case apple

    /// Google Maps
    case google
  }

  /// An enumeration of map styles.
  public enum Style {
    /// A map style that's usually a composite of other types, such as
    /// 'satellite' plus 'standard'.
    case hybrid

    /// A map style that uses images captured from a satellite.
    case satellite

    /// A map vendor's default map style, generally 'plain'.
    case standard

    /// A map style that shows terrain details using features such as contour
    /// lines.
    case terrain
  }

  /// This configuration's map vendor.
  public let vendor: Vendor

  /// This configuration's map style.
  public let style: Style

  fileprivate init(_ vendor: Vendor, _ style: Style) {
    self.vendor = vendor
    self.style = style
  }
}

/// An extension to `MapViewConfiguration` that defines constants for all values
/// supported by the app, and a function to find a value from relevant backup
/// key values.
extension MapViewConfiguration {
  /// A map configuration for Apple Hybrid maps.
  public static let appleHybrid = MapViewConfiguration(.apple, .hybrid)

  /// A map configuration for Apple Satellite maps.
  public static let appleSatellite = MapViewConfiguration(.apple, .satellite)

  /// A map configuration for Apple Standard maps.
  public static let appleStandard = MapViewConfiguration(.apple, .standard)

  /// A map configuration for Google Hybrid maps.
  public static let googleHybrid = MapViewConfiguration(.google, .hybrid)

  /// A map configuration for Google Standard maps.
  public static let googleStandard = MapViewConfiguration(.google, .standard)

  /// A map configuration for Google Terrain maps.
  public static let googleTerrain = MapViewConfiguration(.google, .terrain)

  /// Returns a `MapViewConfiguration` identified by relevant values from a
  /// backup or `nil` if the combination of values does not represent a
  /// configuration supported by the app.
  ///
  /// - Parameters:
  ///   - google: whether or not Google maps are selected.
  ///   - terrain: whether or not Google terrain maps are selected (only relevant if `google` is `true`).
  ///   - type: valid values are `0`, `1` and `2`.
  static func getMapViewConfiguration(google: Bool, terrain: Bool, type: Int) -> MapViewConfiguration? {
    switch (google, terrain, type) {
    case (false, false, 0):
      return appleStandard
    case (false, false, 1):
      return appleSatellite
    case (false, false, 2):
      return appleHybrid
    case (true, false, 0):
      return googleStandard
    case (true, false, 2):
      return googleHybrid
    case (true, true, 0):
      return googleTerrain
    default:
      return nil
    }
  }
}

//----------------------------------------------------------------------------//
//
// MARK: - CustomStringConvertible

extension MapViewConfiguration: CustomStringConvertible {
  /// :nodoc:
  public var description: String {
    return "MapViewConfiguration{vendor: \(vendor), style: \(style)}"
  }
}

//----------------------------------------------------------------------------//
//
// MARK: - Equatable

extension MapViewConfiguration: Equatable {
  /// :nodoc:
  public static func ==(lhs: MapViewConfiguration, rhs: MapViewConfiguration) -> Bool {
    return lhs.style == rhs.style && lhs.vendor == rhs.vendor
  }
}
