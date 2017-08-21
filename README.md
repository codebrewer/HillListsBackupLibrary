# Hill Lists Backup Library

[![Build Status](https://api.travis-ci.org/codebrewer/HillListsBackupLibrary.svg?branch=master)](http://travis-ci.org/codebrewer/HillListsBackupLibrary)

## About

**Hill Lists Backup Library** is a Swift library that provides read-only access
to backup files exported by the [Hill Lists](https://grahamhaley.co.uk/hills/)
iOS app available for iPhone and iPad from the
[App Store](https://itunes.apple.com/gb/app/hill-lists/id315200683).

**Hill Lists** is an iOS app for hill walkers in Britain and Ireland, highly
recommended as a source of hill-related information and for recording, tracking
and visualising hill-bagging progress.

App users interested in examining their data are likely to be better served by
the app's CSV export feature than by this library. While a backup file contains
the app's configuration settings, the identifiers of tracked lists, the
identifiers of ascended hills and the dates and recorded notes of any ascents,
the CSV export provides immediately usable hill-related information such as
name, location and height.

## Motivation

The library is motivated by a desire to learn the Swift programming language and
how to build a reusable Swift library the "right" way. A concrete project is
often the best way to learn new skills. If the resulting library is useful to
anyone then that's a bonus!

## Requirements

The minimum SDK/platform versions required to build and use the library are:
 
* Swift 3.1
* macOS 10.12

The library should also be usable on iOS (probably version 10 onwards) but this
has not been tested.

Unfortunately, Linux is not supported because some APIs used by the library
(*e.g.* `CoreLocation`) are not presently available on Linux.

## Compatibility

Backups exported by Hill Lists 5.1 and 5.2 have been successfully imported.

## Installation

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) automates the
distribution of Swift code. To use this library with the Swift Package Manager,
add a dependency to your `Package.swift` file:

```swift
let package = Package(

        // ...

        dependencies: [
                .Package(url: "https://github.com/codebrewer/HillListsBackupLibrary.git", majorVersion: 1)
        ]
)
```

## Building and Testing

The library uses types introduced in macOS 10.12 so it's likely (at the current
time, with Swift 3.1) that the deployment target must be specified when
building.

### Swift Package Manager

To build without tests:

```bash
swift build -Xswiftc -target -Xswiftc x86_64-apple-macosx10.12
```

To build with, and run, tests:

```bash
swift test -Xswiftc -target -Xswiftc x86_64-apple-macosx10.12
```

To delete build artifacts:

```bash
swift package clean
```

### IDEs

The library can be edited, built and tested in both Xcode and
[AppCode](https://www.jetbrains.com/objc/).

First, use the Swift Package Manager to generate Xcode project files:

```bash
swift package generate-xcodeproj
```

Some project configuration is necessary to be able to build the library and
build and run the tests:

* in the Build Settings for both targets, set the **macOS Deployment Target** to
**macOS 10.12**
* in the Build Phases for the test target, add a **Copy files** phase to copy
the `Data` directory from `Tests/HillListsBackupLibraryTests` to the
`Resources` destination.

If using AppCode then you'll want to create a run/debug configuration for the
unit tests. Lookup of test resources used by `BackupImporterTests` should work
whether running tests from a shell or an IDE.

## Usage

A Hill Lists backup is represented by the `Backup` protocol, instances of which
are created by static functions in the `BackupImporter` struct.

The unit tests in the `BackupImporterTests` class show the library in use, but
in essence:

Open a backup file:

```swift
import HillListsBackupLibrary

let backup: Backup

backup = try BackupImporter.importBackup(path: "/path/to/backup/hlyyyyMMdd@HHmmSS.bak")
```

If no error is thrown then you have a `Backup` implementation and can use the
properties declared by that protocol to access the imported data.

While all of the app's settings as configured by the user are accessible, it's
probably the tracked lists and hill ascents that are of most interest:

```swift
backup.trackedLists.forEach { hillList in
  // hillList is an instance of `HillList`, a type that describes the
  // classification and geographical regions of a list of hills
  print("Tracking \(hillList.classification) in \(hillList.regions)")
}

backup.ascendedHills.forEach { ascendedHill in
  // `ascendedHill` is an instance of `AscendedHill`, a type that contains
  // details of all ascents made of an individual hill
  print("\(ascendedHill.ascents.count) ascent(s) for hill number \(ascendedHill.hillNumber):")
  ascendedHill.ascents.forEach { ascent in print(" \(ascent)") }
}
```

Note that a backup doesn't store information that relates hills to lists. So
while, for instance, lists for the `HillList.Classification.munro` and
`HillList.Classification.hump` classifications might be tracked, and the
ascended hills might contain an ascent of Ben Nevis, there's nothing in the
backup to record that Ben Nevis is a member of those lists. The relationships
between hills and lists require the use of the
[Database of British and Irish Hills](http://www.hills-database.co.uk/) (with
the relevant link information in this example being Ben Nevis's identifier of
`278`, derived from the app's identifier of `"H278"`) or, in the case of the
Irish 900s, some other suitable datasource.

## Documentation

An analysis of backup files is available [here](backup-file-analysis.html).

API [documentation](https://codebrewer.github.io/HillListsBackupLibrary) is
generated by [jazzy](https://github.com/realm/jazzy).

To generate the documentation:

```bash
./generate-docs.sh
```

To view the generated documentation in the default browser:

```bash
open index.html
```

## Privacy

The Hill Lists Backup Library can import backup files that have been exported
from the app and placed somewhere accessible. As the app author's
[privacy policy](https://grahamhaley.co.uk/privacy/) makes clear, app users must
actively choose to export backups from their iOS device and must trust anyone
who then has access to the files. Once available, backup files can be read in a
straightforward manner (although it's quite possible that the app could be
updated to change this).

## Acknowledgments

The Hill Lists iOS app is copyright Graham Haley. The Hill Lists Backup Library
is not affiliated with the iOS app or its developer in any way and is not
endorsed by him.

Various descriptions of hill list definitions that appear in this library's API
documentation have been taken from the
[Database of British and Irish Hills](http://www.hills-database.co.uk/).

## Licensing

This software is licensed under the Apache License Version 2.0. Please see
[LICENSE](LICENSE) for details.
