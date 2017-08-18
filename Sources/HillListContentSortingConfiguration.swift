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

/// An enumeration of ways in which the user can choose to sort the hills within
/// the lists being tracked.
///
/// - Note: The raw values of this enumeration are the identifiers assigned by
///         the app and are therefore an implementation detail.
public enum HillListContentSortingConfiguration: Int {
  /// The user has chosen to sort by hill section, in ascending order by number.
  case section = 0

  /// The user has chosen to sort by hill name, in ascending alphabetical order.
  case name = 1

  /// The user has chosen to sort by hill height, in descending order.
  case height = 2

  /// The user has chosen to sort by distance from the latest recorded location,
  /// in increasing order.
  case distance = 3

  /// The user has chosen to sort by date of ascent, in decreasing chronological
  /// order by oldest ascent, with ascents on unknown dates sorting last.
  case dateClimbed = 4

  /// The user has chosen to sort by number of ascents, in increasing order.
  case ascents = 5
}
