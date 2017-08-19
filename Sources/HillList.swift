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

/// A type that represents a list of hills that can be tracked by the app. In
/// keeping with the way the app presents lists, this type has properties to
/// store:
///
/// * the `HillList.Classification` of hills within the list (*e.g.* Dewey);
/// * the `HillList.Region`s covered by the list (*e.g.* England, Isle of Man & Wales);
/// * the `HillList.Flag` displayed alongside the list's name (*e.g.* United Kingdom).
///
/// The hills tracked by each list are *generally* straightforward to determine
/// based on lookup of classification and regions in the
/// [database of British and Irish hills](http://www.hills-database.co.uk/)
/// (DoBIH). However, the app takes an arguably non-obvious approach when it
/// comes to Ireland and Northern Ireland. For any `HillList`:
///
/// * if `HillList.Region.ireland` is in its `regions` set:
///     * if its `flag` is `HillList.Flag.ireland` then only hills in the Republic of
///       Ireland are included;
///     * if its `flag` is `HillList.Flag.northernIreland` then hills in both the
///       Republic of Ireland and Northern Ireland are included;
///     * if its `flag` is `HillList.Flag.unitedKingdom` then only hills in Northern
///       Ireland are included.
public struct HillList {
  /// A static cache of all hill lists supported by the app, keyed by the app's
  /// identifier.
  private static let hillListsByIdCache: [Int: HillList] = {
    let tuples: [(id: Int, classification: Classification, regions: Set<Region>, flag: Flag)] = [
      (1, .corbett, [.scotland], .scotland),
      (2, .corbettTop, [.scotland], .scotland),
      (3, .donald, [.scotland], .scotland),
      (4, .donaldTop, [.scotland], .scotland),
      (5, .graham, [.scotland], .scotland),
      (6, .hump, [.scotland], .scotland),
      (7, .marilyn, [.scotland], .scotland),
      (8, .munro, [.scotland], .scotland),
      (9, .munroTop, [.scotland], .scotland),
      (10, .murdo, [.scotland], .scotland),
      (11, .newDonald, [.scotland], .scotland),
      (13, .hump, [.isleOfMan], .isleOfMan),
      (14, .marilyn, [.isleOfMan], .isleOfMan),
      (15, .furth, [.wales], .wales),
      (18, .hump, [.wales], .wales),
      (19, .marilyn, [.wales], .wales),
      (21, .birkett, [.england], .england),
      (23, .hump, [.england], .england),
      (25, .marilyn, [.england], .england),
      (27, .outlyingFell, [.england], .england),
      (28, .wainwright, [.england], .england),
      (29, .countyTopCurrent, [.england, .ireland, .isleOfMan, .scotland, .wales], .unitedKingdom),
      (30, .dewey, [.england, .isleOfMan, .wales], .unitedKingdom),
      (31, .hewitt, [.england, .ireland, .wales], .unitedKingdom),
      (34, .nuttall, [.england, .wales], .unitedKingdom),
      (35, .trail100, [.england, .ireland, .scotland, .wales], .unitedKingdom),
      (37, .carn, [.ireland], .northernIreland),
      (38, .nineHundred, [.ireland], .ireland),
      (39, .arderin, [.ireland], .northernIreland),
      (40, .binnion, [.ireland], .northernIreland),
      (41, .vandeleurLynam, [.ireland], .northernIreland),
      (46, .countyTopCurrent, [.ireland], .northernIreland),
      (47, .donaldDewey, [.scotland], .scotland),
      (48, .furth, [.england], .england),
      (49, .grahamTop, [.scotland], .scotland),
      (50, .hewitt, [.ireland], .northernIreland),
      (51, .highlandFive, [.scotland], .scotland),
      (52, .hump, [.ireland], .northernIreland),
      (53, .marilyn, [.ireland], .northernIreland),
      (54, .myrddynDewey, [.ireland], .northernIreland),
      (55, .simm, [.scotland], .scotland),
      (56, .simm, [.isleOfMan], .isleOfMan),
      (57, .simm, [.wales], .wales),
      (58, .fellranger, [.england], .england),
      (59, .simm, [.england], .england),
      (60, .synge, [.england], .england),
      (61, .simm, [.ireland], .northernIreland),
      (62, .londonBorough, [.england], .england),
      (63, .dillon, [.ireland], .northernIreland),
      (64, .bridge, [.england, .isleOfMan, .wales], .unitedKingdom),
      (65, .buxtonAndLewis, [.england, .isleOfMan, .wales], .unitedKingdom),
      (66, .countyTopHistorical, [.england, .ireland, .isleOfMan, .scotland, .wales], .unitedKingdom),
      (67, .countyTopHistorical, [.ireland], .northernIreland),
      (68, .countyTopAdministrative, [.england, .isleOfMan, .scotland, .wales], .unitedKingdom)
    ]

    var cache = [Int: HillList]()

    tuples.forEach { tuple in
      registerHillList(tuple.id, tuple.classification, tuple.regions, tuple.flag, &cache)
    }

    return cache
  }()

  private static func registerHillList(_ id: Int,
                                       _ classification: Classification,
                                       _ regions: Set<Region>,
                                       _ flag: Flag,
                                       _ cache: inout [Int: HillList]) {
    cache[id] = HillList(id: id, classification: classification, regions: regions, flag: flag)
  }

  /// Returns the `HillList` registered for the given identifier, if any. Only
  /// identifiers seen in version 5.2 of the app are recognized.
  ///
  /// - Parameter id: a hill list identifier.
  static func getHillList(id: Int) -> HillList? {
    return hillListsByIdCache[id]
  }

  /// The identifier assigned by the app to this list.
  let id: Int

  /// The classification of hills in this list.
  public let classification: Classification

  /// The geographical regions covered by this list.
  public let regions: Set<Region>

  /// The flag used by the app for this list.
  public let flag: Flag

  fileprivate init(id: Int, classification: Classification, regions: Set<Region>, flag: Flag) {
    self.id = id
    self.classification = classification
    self.regions = regions
    self.flag = flag
  }
}

//----------------------------------------------------------------------------//
//
// MARK: - CustomStringConvertible

extension HillList: CustomStringConvertible {
  /// :nodoc:
  public var description: String {
    return "HillList{" +
            "id: \(id), " +
            "classification: \(classification), " +
            "regions: \(regions), " +
            "flag: \(flag) " +
            "}"
  }
}

//----------------------------------------------------------------------------//
//
// MARK: - Equatable

extension HillList: Equatable {
  /// :nodoc:
  public static func ==(lhs: HillList, rhs: HillList) -> Bool {
    return lhs.id == rhs.id &&
            lhs.classification == rhs.classification &&
            lhs.regions == rhs.regions &&
            lhs.flag == rhs.flag
  }
}

//----------------------------------------------------------------------------//
//
// MARK: - Classification

extension HillList {
  /// An enumeration of hill classifications.
  ///
  /// Descriptions of the case values are taken from the
  /// [database notes](http://www.hills-database.co.uk/database_notes.html)
  /// of the Database of British and Irish Hills (DoBIH).
  ///
  /// - Note: the raw value of each case is its unique ID of the classification
  ///         in the DoBIH, with the exception of `Classification.nineHundred`
  ///         which is not present in that database.
  public enum Classification: String {
    /// A hill in Ireland at least 500m in height with a drop of at least 30m on
    /// all sides.
    case arderin = "A"

    /// A hill in Ireland below 400m in height with a drop of at least 100m on
    /// all sides.
    case binnion = "Bin"

    /// A hill in the Lake District over 1000ft in height listed in Bill Birkett's
    /// [Complete Lakeland Fells](https://www.ldwa.org.uk/ldp/members/show_publication.php?menu_type=S&publication_id=8284).
    case birkett = "B"

    /// A list published by Bridge in 1973.
    case bridge = "Bg"

    /// A list published by Buxton and Lewis in 1986.
    case buxtonAndLewis = "BL"

    /// A hill in Ireland between 400 and 499.9m in height with a drop of at
    /// least 30m on all sides.
    case carn = "Ca"

    /// A hill in Scotland between 2500 and 2999ft in height with a drop of at
    /// least 500ft on all sides.
    case corbett = "C"

    /// A hill in Scotland between 2500 and 2999ft in height with a drop of at
    /// least 30m on all sides.
    case corbettTop = "CT"

    /// The highest point within (or sometimes on) a boundary of each county as
    /// it existed from the mid 1970s until some time in the 1990s.
    case countyTopAdministrative = "CoA"

    /// The highest point within (or sometimes on) a boundary of each county as
    /// it has existed from some time in the 1990s.
    case countyTopCurrent = "CoU"

    /// The highest point within (or sometimes on) a boundary of each county as
    /// it existed until the mid 1970s.
    case countyTopHistorical = "CoH"

    /// A hill in England, Wales and the Isle of Man at least 500m in height and
    /// below 609.6m in height with a drop of at least 30m on all sides.
    case dewey = "5"

    /// A hill in Ireland at least 2000ft in height published in
    /// [The Mountains of Ireland](http://www.paddydillon.co.uk/guidebook/the-mountains-of-ireland/).
    case dillon = "Dil"

    /// A hill in the Scottish Lowlands at least 500m in height and below 609.6m
    /// in height with a drop of at least 30m on all sides.
    case donaldDewey = "5D"

    /// A hill in the Scottish Lowlands at least 2000ft in height.
    case donald = "D"

    /// A hill in the Scottish Lowlands at least 2000ft in height but that
    /// (somehow...) aren't Donalds.
    case donaldTop = "DT"

    /// A hill in the Lake District that are included in the
    /// [Lakeland Fellranger](http://www.cicerone.co.uk/product/index.cfm/cid/77/catalogue/fellranger)
    /// guides by Mark Richards.
    case fellranger = "Fel"

    /// A Munro equivalent in England, Wales and Ireland.
    ///
    /// - SeeAlso: `HillList.Category.munros`
    case furth = "F"

    /// A hill in Scotland between 2000 and 2499 feet in height with a drop of
    /// at least 150m on all sides.
    case graham = "G"

    /// A Scottish hill between 2000 and 2499 feet in height with a drop of at
    /// least 30m on all sides.
    case grahamTop = "GT"

    /// A hill in England, Wales and Ireland at least 2000ft in height with a
    /// drop of at least 30m on all sides.
    case hewitt = "Hew"

    /// A hill in the Scottish Highlands at least 500m in height and below
    /// 609.6m in height with a drop of at least 30m on all sides.
    case highlandFive = "5H"

    /// A hill of any height with a drop of 100m or more on all sides.
    case hump = "Hu"

    /// The highest point within the boundary of a London borough as they have
    /// existed from some time in the 1990s.
    case londonBorough = "CoL"

    /// A hill of any height with a drop of 150m or more on all sides.
    case marilyn = "Ma"

    /// A hill in Scotland over 3000ft in height.
    case munro = "M"

    /// A subsidiary summit of a Munro that meets the Munro height criterion.
    ///
    /// - SeeAlso: `HillList.Category.munros`
    case munroTop = "MT"

    /// A hill in Scotland at least 3000ft in height with a drop of at least 30m
    /// on all sides.
    case murdo = "Mur"

    /// A hill in Ireland at least 500m in height and below 609.6m in height
    /// with a drop of at least 30m on all sides.
    case myrddynDewey = "5M"

    /// A reclassified Donald with a simplified drop criterion of 30m.
    ///
    /// - SeeAlso: `HillList.Category.donalds`
    case newDonald = "DN"

    /// A hill in Ireland over 900m in height and with a prominence of at least
    /// 15m. Note that this classification is not present in the DoBIH.
    case nineHundred = "900"

    /// A hill in England and Wales at least 2000ft in height with a drop of at
    /// least 15m on all sides, as published in
    /// [The Mountains of England and Wales](http://www.nuttalls.com/general/books.htm).
    case nuttall = "N"

    /// A hill listed in Wainwright's *The Outlying Fells of Lakeland*.
    case outlyingFell = "WO"

    /// A hill in Britain and Ireland at least 600m in height with a drop of at
    /// least 30m on all sides.
    case simm = "Sim"

    /// A hill in the Lake District over 1000ft listed in *The Lakeland
    /// Summits*, published in 1995 by Tim Synges.
    case synge = "Sy"

    /// A hill in the list of
    /// [100 hills](http://www.livefortheoutdoors.com/trail100)
    /// published in *Trail* magazine in 2007.
    case trail100 = "T100"

    /// A hill in Ireland at least 600m in height with a drop of at least 15m on
    /// all sides.
    case vandeleurLynam = "VL"

    /// A hill listed in volumes 1-7 of Wainwright's *A Pictorial Guide to the
    /// Lakeland Fells*.
    case wainwright = "W"
  }
}

//----------------------------------------------------------------------------//
//
// MARK: - Region

extension HillList {
  /// An enumeration of geographical regions within Britain and Ireland to which
  /// hill lists can belong.
  ///
  /// - Note: the raw value of each case is the reference letter used by the
  ///         Database of British and Irish Hills (DoBIH) for the region.
  public enum Region: String {
    /// For hills in England.
    case england = "E"

    /// For hills in Ireland.
    case ireland = "I"

    /// For hills in the Isle of Man.
    case isleOfMan = "M"

    /// For hills in Scotland.
    case scotland = "S"

    /// For hills in Wales.
    case wales = "W"
  }
}

//----------------------------------------------------------------------------//
//
// MARK: - Flag

extension HillList {
  /// An enumeration of flags used alongside list names in the app's view of
  /// tracked lists.
  public enum Flag {
    /// The flag of England.
    case england

    /// The flag of the Republic of Ireland.
    case ireland

    /// The flag of the Isle of Man.
    case isleOfMan

    /// The flag of Northern Ireland.
    case northernIreland

    /// The flag of Scotland.
    case scotland

    /// The flag of the United Kingdom.
    case unitedKingdom

    /// The flag of Wales.
    case wales
  }
}