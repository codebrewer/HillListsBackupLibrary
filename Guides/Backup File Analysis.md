# Analysis of a Hill Lists Backup File

This guide provides information on how to read and interpret the content of a
backup file exported by the Hill Lists app, insofar as how to do that has been
determined. This analysis informed the design of the API and various datatypes
provided by the Hill Lists Backup Library. Code snippets use Swift since that's
the language in which the library is written.

## Contents

* [Loading](#loading)
* [Dictionary Keys](#dictionary-keys)
* [Backup Configuration](#backup-configuration)
* [Map View Configuration](#map-view-configuration)

## Loading

A backup file appears to be a serialized dictionary since it's possible to
deserialize it to produce a `Dictionary<String, Any>`:

```swift
// `path` is a `String` naming the path to a backup file
let data = NSKeyedUnarchiver.unarchiveObject(withFile: path) as? [String: Any]
```

More generally, if the backup content is made available at a URL:

```swift
// `url` is a `URL` identifying the location of a backup file
let urlData = try Data(contentsOf: url)
let data = NSKeyedUnarchiver.unarchiveObject(with: urlData) as? [String: Any]
```

## Dictionary Keys

Several backup-related keys may be present in the dictionary and the name of
each is used as a case of the `BackupKey` enum in the library:

* [ascents](#code-ascents-code)
* [autobackup](#code-autobackup-code)
* [disclaimer](#code-disclaimer-code)
* [distance](#code-distance-code)
* [email](#code-email-code)
* [filename](#code-filename-code)
* [filter](#code-filter-code)
* [google](#code-google-code)
* [hash](#code-hash-code)
* [height](#code-height-code)
* [icloud](#code-icloud-code)
* [latitude](#code-latitude-code)
* [lists](#code-lists-code)
* [longitude](#code-longitude-code)
* [multiple](#code-multiple-code)
* [percent](#code-percent-code)
* [purged](#code-purged-code)
* [restore](#code-restore-code)
* [root](#code-root-code)
* [share](#code-share-code)
* [sms](#code-sms-code)
* [sort](#code-sort-code)
* [terrain](#code-terrain-code)
* [type](#code-type-code)
* [version](#code-version-code)

---

### `ascents`

`Dictionary<String, [Dictionary<String, Any>]>`

The value of this key is a dictionary. Each key in the dictionary is a `String`
that is the identifier assigned by the
[Database of British and Irish Hills](http://www.hills-database.co.uk/) to an
individual hill, prefixed with the letter `H`. The value of each key is an array
having one element for each recorded ascent of the hill identified by that key.
A hill must have at least one recorded ascent to be present in the dictionary.
Each array element is itself a further dictionary that stores zero, one or two
pieces of information for an ascent. Possible keys are:

* a key named `date` that has as its value a `Date` recording the date on which
the ascent was made; if not present then the date of ascent is not recorded;
* a key named `notes` that has as its value a `String` recording any notes made
for the ascent; if not present then no notes were recorded.

---

### `autobackup`

`Bool`

Part of the [backup configuration](#backup-configuration), in combination
with [icloud](#code-icloud-code). This particular key's value indicates whether
or not automatic backup is selected. Automatic backup is supported only to
iCloud.

---

### `disclaimer`

`Bool`

Indicates whether or not the user has accepted the disclaimer shown
when opting to allow the app to use the location reported by their iOS device or
selected manually (the location is to be used for non-navigational purposes).

---

### `distance`

`String` : `km` | `mi`

The selected unit of measurement for presenting distances, either kilometres or miles.

---

### `email`

`String`

The email address used by the app's CSV export feature.

---

`String`

### `filename`

The name of the file in which the backup was originally stored on creation.

---

### `filter`

`Int`

The purpose of this key is unknown. Values of `0` and `1` have been seen but it
can presumably take other values otherwise a `Bool` would probably have been
used.

---

### `google`

`Bool`

Part of the [map view configuration](#map-view-configuration), in combination
with [terrain](#code-terrain-code) and [type](#code-type-code). This particular
key's value indicates whether Apple or Google maps has been chosen for map-based
views.

---

### `hash`

`Int`

Presumably a hash unique to an individual backup and perhaps used to verify its
integrity when being restored.

---

### `height`

`String` : `ft` | `m`

The selected unit of measurement for presenting heights, either feet or metres.

---

### `icloud`

`Bool`

Part of the [backup configuration](#backup-configuration), in combination
with [autobackup](#code-autobackup-code). This particular key's value indicates
whether iCloud or Dropbox has been selected for off-device backup storage.

---

### `latitude`

`Double`

The latitude component of the location recorded by the app's location feature. A
default location in Fort William appears to be used.

---

### `lists`

`[Int]`

An array of tracked hill list identifiers as assigned by the app. There will
always be at least one element since the app requires at least one list to be
tracked.

The elements are sorted according to the selected sort order - see
[percent](#code-percent-code).

---

### `longitude`

`Double`

The longitude component of the location recorded by the app's location feature.
A default location in Fort William appears to be used.

---

### `multiple`

`Bool`

Indicates whether not the user has opted to track multiple rounds of ascents.

---

### `percent`

`Bool?`

Indicates the ordering of tracked [lists](#code-lists-code) on the app's initial
view:

* if not present then lists are ordered manually by the user;
* if present and `false` then lists are sorted by name, in ascending
alphabetical order;
* if present and `true` then lists are sorted by percentage of hills complete,
in descending order.

---

### `purged`

`Bool`

The purpose of this key is unknown and its value has only ever been observed to
be `true`.

---

### `restore`

`[Int]`

The purpose of this key is unknown and its value has only ever been observed to
contain three elements, all `-1`.

---

### `root`

`Bool`

Believed to be unused from Hill Lists version 5.2 onwards but previously used to
indicate whether backups to Dropbox were saved to the root or an app-specific
Dropbox folder. API changes introduced by Dropbox during 2017 require the use of
app-specific folders.

---

### `share`

`String`

The email address used by the app's location sharing feature.

---

### `sms`

`String`

The phone number used by the app's location sharing feature.

---

### `sort`

`Int` : `0` | `1` | `2` | `3` | `4` | `5`

Indicates how hills are sorted within the view of an individual list's content:

* `0` - hills are sorted by section, in ascending order by number;
* `1` - hills are sorted by name, in ascending alphabetical order;
* `2` - hills are sorted by height, in descending order;
* `3` - hills are sorted by distance from the user's recorded location, closest
to furthest;
* `4` - hills are sorted by date of ascent, in decreasing chronological order by
oldest ascent, with unknown ascent dates sorting last;
* `5` - hills are sorted by number of ascents, in increasing order.

---

### `terrain`

`Bool`

Part of the [map view configuration](#map-view-configuration), in combination
with [google](#code-google-code) and [type](#code-type-code).

---

### `type`

`Int` : `0` | `1` | `2`

Part of the [map view configuration](#map-view-configuration), in combination
with [google](#code-google-code) and [terrain](#code-terrain-code).

---

### `version`

`Int`

Presumably the version format of the backup file; its value has only ever been
observed to be `430`.

## Backup Configuration

The backup method and destination for backup files are indicated by the values
of two keys:

* [autobackup](#code-autobackup-code)
* [icloud](#code-icloud-code)

*plus*, it seems, the location of the backup file when a restore operation is
performed.

| autobackup | icloud  | Location at restore time | Backup option selected |
| ---------- | ------- | ------------------------ | ---------------------- |
| `true`     | `true`  | *Can only be iCloud*     | Automatic (iCloud)     |
| `false`    | `true`  | *Can only be iCloud*     | Manual (iCloud)        |
| `false`    | `false` | On the iOS device        | Manual                 |
| `false`    | `false` | In Dropbox               | Manual (Dropbox)       |

Since this library can only read a backup file that has been exported from an
iOS device it has no way to differentiate between the *Manual* and *Manual
(Dropbox)* options and will report a special case of *Manual (indeterminate)*
(represented by the `BackupConfiguration.manualIndeterminate` static constant).
This special case is defined by the library and doesn't exist in the app itself.

## Map View Configuration

The map vendor and style used in the map-based views are indicated by the values
of three keys:

* [google](#code-google-code)
* [terrain](#code-terrain-code)
* [type](#code-type-code)

Six different configurations are supported:

| google  | terrain  | type  | Map vendor and type |
| ------- | -------- | ----- | ------------------- |
| `false` | `false`  | 0     | Apple Standard      |
| `false` | `false`  | 1     | Apple Satellite     |
| `false` | `false`  | 2     | Apple Hybrid        |
| `true`  | `false`  | 0     | Google Standard     |
| `true`  | `false`  | 2     | Google Hybrid       |
| `true`  | `true`   | 0     | Google Terrain      |
