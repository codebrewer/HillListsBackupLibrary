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

/// A type that represents a single ascent of a single hill.
///
/// - SeeAlso: `AscendedHill`
public struct Ascent {
  /// The date on which this ascent was made, if recorded.
  public let date: Date?

  /// Any notes recorded for this ascent.
  public let notes: String?

  /// Creates an ascent, optionally recording the date on which it was made and
  /// any notes made.
  ///
  /// - Parameters:
  ///   - date: the date on which this ascent was made, if known.
  ///   - notes: notes associated with this ascent, if any.
  fileprivate init(date: Date?, notes: String?) {
    self.date = date
    self.notes = notes
  }
}

extension Ascent {
  /// Returns an instance of this class by processing the relevant data from a
  /// backup data source, or `nil` if the data is invalid.
  ///
  /// - Parameter data: data for a single ascent of a hill.
  static func readAscent(data: [String: Any]) -> Ascent {
    // A closure around our data to return the value for a key
    let getData = { (key: BackupKey.AscentsKey) -> Any? in
      return data[key.rawValue]
    }

    // Date of ascent
    //
    let date = getData(.date) as? Date

    // Any notes recorded for the ascent.
    //
    let notes = getData(.notes) as? String

    return Ascent(date: date, notes: notes)
  }
}

//----------------------------------------------------------------------------//
//
// MARK: - CustomStringConvertible

extension Ascent: CustomStringConvertible {
  /// :nodoc:
  public var description: String {
    return "Ascent{date: \(date?.description ?? "<unknown>"), notes: \(notes?.prettyPrintingNewlines() ?? "<none>")}"
  }
}

//----------------------------------------------------------------------------//
//
// MARK: - Equatable

extension Ascent: Equatable {
  /// :nodoc:
  public static func ==(lhs: Ascent, rhs: Ascent) -> Bool {
    return lhs.date == rhs.date && lhs.notes == rhs.notes
  }
}

//----------------------------------------------------------------------------//
//
// MARK: - String

extension String {
  /// Returns a new string made from the `String` by replacing all newline
  /// characters with the literal characters `\n`.
  func prettyPrintingNewlines() -> String {
    return self.replacingOccurrences(of: "\n", with: "\\n")
  }
}
