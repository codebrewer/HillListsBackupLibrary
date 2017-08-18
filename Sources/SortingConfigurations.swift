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

/// A type that stores information on how various items should be sorted for
/// viewing.
public struct SortingConfigurations {
  /// How the tracked lists are sorted in the app's initial view.
  public let hillListsSortingConfiguration: HillListsSortingConfiguration

  /// How the hills within a list are sorted when viewing the list's content.
  public let hillListContentSortingConfiguration: HillListContentSortingConfiguration
}

//----------------------------------------------------------------------------//
//
// MARK: - CustomStringConvertible

extension SortingConfigurations: CustomStringConvertible {
  /// :nodoc:
  public var description: String {
    return "SortingConfigurations{" +
            "hillListsSortingConfiguration: \(hillListsSortingConfiguration), " +
            "hillListContentSortingConfiguration: \(hillListContentSortingConfiguration)" +
            "}"
  }
}

//----------------------------------------------------------------------------//
//
// MARK: - Equatable

extension SortingConfigurations: Equatable {
  /// :nodoc:
  public static func ==(lhs: SortingConfigurations, rhs: SortingConfigurations) -> Bool {
    return lhs.hillListsSortingConfiguration == rhs.hillListsSortingConfiguration &&
            lhs.hillListContentSortingConfiguration == rhs.hillListContentSortingConfiguration
  }
}
