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

/// An enumeration of ways in which the user can choose to sort the lists of
/// hills being tracked.
public enum HillListsSortingConfiguration {
  /// The user has chosen to sort the lists manually.
  case manual

  /// The user has chosen to sort the lists by name, in ascending alphabetical
  /// order.
  case nameAscending

  /// The user has chosen to sort the lists by percentage of hills complete, in
  /// descending order.
  case percentageCompleteDescending
}

extension HillListsSortingConfiguration {
  static func getHillListsSortingConfiguration(percent: Bool?) -> HillListsSortingConfiguration {
    // If `percent` is present then its value determines which of the non-manual
    // sorting specifications has been chosen
    //
    if let percent = percent {
      return percent ? .percentageCompleteDescending : nameAscending
    }

    // If `percent` is not present then manual sorting has been chosen
    //
    return .manual
  }
}
