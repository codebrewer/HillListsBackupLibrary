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

/// An enumeration of errors that can occur when interacting with a backup.
public enum BackupError: Error {
  /// Indicates that the backup data source could not be opened for import.
  case openFailed

  /// Indicates that the backup data source contained some invalid data or did
  /// not contain all expected data.
  case initializationFailed
}
