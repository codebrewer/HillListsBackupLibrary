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

/// A type that represents all recorded ascents of a single hill.
public struct AscendedHill {
  /// The unique identifier of the hill, being the letter `H` suffixed with the
  /// hill's identifier in the database of British and Irish hills.
  public let hillNumber: String

  /// The ascents made of the hill. This array has at least one entry.
  public let ascents: [Ascent]

  /// Creates a record with a particular hill identifier and set of ascents.
  ///
  /// - Parameters:
  ///   - hillNumber: the letter `H` suffixed with the hill's identifying number in the database of British and Irish hills.
  ///   - ascents: the ascents made of the hill.
  fileprivate init(hillNumber: String, ascents: [Ascent]) {
    self.hillNumber = hillNumber
    self.ascents = ascents
  }
}

extension AscendedHill {
  /// Returns an array of instances of this class by processing the relevant
  /// data from a backup.
  ///
  /// - Parameter data: the dictionary stored in a backup against the `BackupKey.ascents` key.
  static func readAscendedHills(data: [String: Any]) -> [AscendedHill] {
    return data.flatMap {
      guard let ascentsData = $1 as? [[String: Any]], ascentsData.count > 0 else {
        return nil
      }

      return AscendedHill(hillNumber: $0, ascents: ascentsData.map({ Ascent.readAscent(data: $0) }))
    }
  }
}

//----------------------------------------------------------------------------//
//
// MARK: - CustomStringConvertible

extension AscendedHill: CustomStringConvertible {
  /// :nodoc:
  public var description: String {
    return "AscendedHill{hillNumber:\(hillNumber), ascents:\(ascents)}"
  }
}

//----------------------------------------------------------------------------//
//
// MARK: - Equatable

extension AscendedHill: Equatable {
  /// :nodoc:
  public static func ==(lhs: AscendedHill, rhs: AscendedHill) -> Bool {
    return lhs.hillNumber == rhs.hillNumber && lhs.ascents == rhs.ascents
  }
}
