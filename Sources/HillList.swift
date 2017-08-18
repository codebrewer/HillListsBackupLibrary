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

/// An enumeration of all hill lists that can be tracked by the Hill Lists app.
///
/// The app groups lists by country/territory (loosely, by 'region') within
/// Britain and Ireland and uses a flag image and name in its UI to indicate the
/// region and hill category respectively. Each case of this enumeration
/// therefore represents a named category of hills (*e.g. Marilyns*) within a
/// geographical region (*e.g. England*). Some lists apply to only one region
/// (*e.g. Munros* are found only in *Scotland*) and the corresponding case
/// contains no region element in its name.
///
/// - Note: The raw values of this enumeration are the identifiers assigned by
///         the app and are therefore an implementation detail.
/// - Warning: this enum smells... Should it really be this
public enum HillList: Int {
  /// A hill list with category `HillList.Category.corbetts` and region
  /// `HillList.Region.scotland`.
  case corbetts = 1

  /// A hill list with category `HillList.Category.corbettTops` and region
  /// `HillList.Region.scotland`.
  case corbettTops = 2

  /// A hill list with category `HillList.Category.donalds` and region
  /// `HillList.Region.scotland`.
  case donalds = 3

  /// A hill list with category `HillList.Category.donaldTops` and region
  /// `HillList.Region.scotland`.
  case donaldTops = 4

  /// A hill list with category `HillList.Category.grahams` and region
  /// `HillList.Region.scotland`.
  case grahams = 5

  /// A hill list with category `HillList.Category.humps` and region
  /// `HillList.Region.scotland`.
  case scottishHumps = 6

  /// A hill list with category `HillList.Category.marilyns` and region
  /// `HillList.Region.scotland`.
  case scottishMarilyns = 7

  /// A hill list with category `HillList.Category.munros` and region
  /// `HillList.Region.scotland`.
  case munros = 8

  /// A hill list with category `HillList.Category.munroTops` and region
  /// `HillList.Region.scotland`.
  case munroTops = 9

  /// A hill list with category `HillList.Category.murdos` and region
  /// `HillList.Region.scotland`.
  case murdos = 10

  /// A hill list with category `HillList.Category.newDonalds` and region
  /// `HillList.Region.scotland`.
  case newDonalds = 11

  /// A hill list with category `HillList.Category.humps` and region
  /// `HillList.Region.isleOfMan`.
  case isleOfManHumps = 13

  /// A hill list with category `HillList.Category.marilyns` and region
  /// `HillList.Region.isleOfMan`.
  case isleOfManMarilyns = 14

  /// A hill list with category `HillList.Category.furths` and region
  /// `HillList.Region.wales`.
  case welshFurths = 15

  /// A hill list with category `HillList.Category.humps` and region
  /// `HillList.Region.wales`.
  case welshHumps = 18

  /// A hill list with category `HillList.Category.marilyns` and region
  /// `HillList.Region.wales`.
  case welshMarilyns = 19

  /// A hill list with category `HillList.Category.birketts` and region
  /// `HillList.Region.england`.
  case birketts = 21

  /// A hill list with category `HillList.Category.humps` and region
  /// `HillList.Region.england`.
  case englishHumps = 23

  /// A hill list with category `HillList.Category.marilyns` and region
  /// `HillList.Region.england`.
  case englishMarilyns = 25

  /// A hill list with category `HillList.Category.outlyingFells` and region
  /// `HillList.Region.england`.
  case outlyingFells = 27

  /// A hill list with category `HillList.Category.wainwrights` and region
  /// `HillList.Region.england`.
  case wainwrights = 28

  /// A hill list with category `HillList.Category.countyTopsCurrent` and region
  /// `HillList.Region.unitedKingdom`.
  case ukCountyTopsCurrent = 29

  /// A hill list with category `HillList.Category.deweys` and region
  /// `HillList.Region.unitedKingdom`.
  case ukDeweys = 30

  /// A hill list with category `HillList.Category.hewitts` and region
  /// `HillList.Region.unitedKingdom`.
  case ukHewitts = 31

  /// A hill list with category `HillList.Category.nuttalls` and region
  /// `HillList.Region.unitedKingdom`.
  case nuttalls = 34

  /// A hill list with category `HillList.Category.trail100s` and region
  /// `HillList.Region.unitedKingdom`.
  case trail100s = 35

  /// A hill list with category `HillList.Category.carns` and region
  /// `HillList.Region.northernIreland`.
  case carns = 37

  /// A hill list with category `HillList.Category.nineHundreds` and region
  /// `HillList.Region.ireland`.
  case nineHundreds = 38

  /// A hill list with category `HillList.Category.arderins` and region
  /// `HillList.Region.northernIreland`.
  case arderins = 39

  /// A hill list with category `HillList.Category.binnions` and region
  /// `HillList.Region.northernIreland`.
  case binnions = 40

  /// A hill list with category `HillList.Category.vandeleurLynams` and region
  /// `HillList.Region.northernIreland`.
  case vandeleurLynams = 41

  /// A hill list with category `HillList.Category.countyTopsCurrent` and region
  /// `HillList.Region.northernIreland`.
  case northernIrishCountyTopsCurrent = 46

  /// A hill list with category `HillList.Category.donaldDeweys` and region
  /// `HillList.Region.scotland`.
  case donaldDeweys = 47

  /// A hill list with category `HillList.Category.furths` and region
  /// `HillList.Region.england`.
  case englishFurths = 48

  /// A hill list with category `HillList.Category.grahamTops` and region
  /// `HillList.Region.scotland`.
  case grahamTops = 49

  /// A hill list with category `HillList.Category.hewitts` and region
  /// `HillList.Region.northernIreland`.
  case northernIrishHewitts = 50

  /// A hill list with category `HillList.Category.highlandFives` and region
  /// `HillList.Region.scotland`.
  case highlandFives = 51

  /// A hill list with category `HillList.Category.humps` and region
  /// `HillList.Region.northernIreland`.
  case northernIrishHumps = 52

  /// A hill list with category `HillList.Category.marilyns` and region
  /// `HillList.Region.northernIreland`.
  case northernIrishMarilyns = 53

  /// A hill list with category `HillList.Category.myrddynDeweys` and region
  /// `HillList.Region.northernIreland`.
  case myrddynDeweys = 54

  /// A hill list with category `HillList.Category.simms` and region
  /// `HillList.Region.scotland`.
  case scottishSimms = 55

  /// A hill list with category `HillList.Category.simms` and region
  /// `HillList.Region.isleOfMan`.
  case isleOfManSimms = 56

  /// A hill list with category `HillList.Category.simms` and region
  /// `HillList.Region.wales`.
  case welshSimms = 57

  /// A hill list with category `HillList.Category.fellrangers` and region
  /// `HillList.Region.england`.
  case fellrangers = 58

  /// A hill list with category `HillList.Category.simms` and region
  /// `HillList.Region.england`.
  case englishSimms = 59

  /// A hill list with category `HillList.Category.synges` and region
  /// `HillList.Region.england`.
  case synges = 60

  /// A hill list with category `HillList.Category.simms` and region
  /// `HillList.Region.northernIreland`.
  case northernIrishSimms = 61

  /// A hill list with category `HillList.Category.londonBoroughs` and region
  /// `HillList.Region.england`.
  case londonBoroughs = 62

  /// A hill list with category `HillList.Category.dillons` and region
  /// `HillList.Region.northernIreland`.
  case dillons = 63

  /// A hill list with category `HillList.Category.bridges` and region
  /// `HillList.Region.unitedKingdom`.
  case bridges = 64

  /// A hill list with category `HillList.Category.buxtonAndLewis` and region
  /// `HillList.Region.unitedKingdom`.
  case buxtonAndLewis = 65

  /// A hill list with category `HillList.Category.countyTopsHistorical` and
  /// region `HillList.Region.unitedKingdom`.
  case ukCountyTopsHistorical = 66

  /// A hill list with category `HillList.Category.countyTopsHistorical` and
  /// region `HillList.Region.northernIreland`.
  case northernIrishCountyTopsHistorical = 67

  /// A hill list with category `HillList.Category.countyTopsAdministrative` and
  /// region `HillList.Region.unitedKingdom`.
  case countyTopsAdministrative = 68
}

extension HillList {
  /// An enumeration of hill list categories without any geographical
  /// consideration.
  ///
  /// The descriptions of the case values are taken from the
  /// [database notes](http://www.hills-database.co.uk/database_notes.html)
  /// of the Database of British and Irish Hills.
  public enum Category: String {
    /// Hills in Ireland at least 500m in height with a drop of at least 30m on
    /// all sides.
    case arderins = "A"

    /// Hills in Ireland below 400m in height with a drop of at least 100m on
    /// all sides.
    case binnions = "Bin"

    /// Hills in the Lake District over 1000ft in height listed in Bill Birkett's
    /// [Complete Lakeland Fells](https://www.ldwa.org.uk/ldp/members/show_publication.php?menu_type=S&publication_id=8284).
    case birketts = "B"

    /// A list published by Bridge in 1973.
    case bridges = "Bg"

    /// A list published by Buxton and Lewis in 1986.
    case buxtonAndLewis = "BL"

    /// Hills in Ireland between 400 and 499.9m in height with a drop of at
    /// least 30m on all sides.
    case carns = "Ca"

    /// Hills in Scotland between 2500 and 2999ft in height with a drop of at
    /// least 500ft on all sides.
    case corbetts = "C"

    /// Hills in Scotland between 2500 and 2999ft in height with a drop of at
    /// least 30m on all sides.
    case corbettTops = "CT"

    /// The highest point within (or sometimes on) a boundary of each county as
    /// it existed from the mid 1970s until some time in the 1990s.
    case countyTopsAdministrative = "CoA"

    /// The highest point within (or sometimes on) a boundary of each county as
    /// it has existed from some time in the 1990s.
    case countyTopsCurrent = "CoU"

    /// The highest point within (or sometimes on) a boundary of each county as
    /// it existed until the mid 1970s.
    case countyTopsHistorical = "CoH"

    /// Hills in England, Wales and the Isle of Man at least 500m in height and
    /// below 609.6m in height with a drop of at least 30m on all sides.
    case deweys = "5"

    /// Hills in Ireland at least 2000ft in height published in
    /// [The Mountains of Ireland](http://www.paddydillon.co.uk/guidebook/the-mountains-of-ireland/).
    case dillons = "Dil"

    /// Hills in the Scottish Lowlands at least 500m in height and below 609.6m
    /// in height with a drop of at least 30m on all sides.
    case donaldDeweys = "5D"

    /// Hills in the Scottish Lowlands at least 2000ft in height.
    case donalds = "D"

    /// Hills in the Scottish Lowlands at least 2000ft in height but that
    /// (somehow...) aren't Donalds.
    case donaldTops = "DT"

    /// Hills in the Lake District that are included in the
    /// [Lakeland Fellranger](http://www.cicerone.co.uk/product/index.cfm/cid/77/catalogue/fellranger)
    /// guides by Mark Richards.
    case fellrangers = "Fel"

    /// Munro equivalents in England, Wales and Ireland.
    ///
    /// - SeeAlso: `HillList.Category.munros`
    case furths = "F"

    /// Hills in Scotland between 2000 and 2499 feet in height with a drop of at
    /// least 150m on all sides.
    case grahams = "G"

    /// Scottish hills between 2000 and 2499 feet in height with a drop of at
    /// least 30m on all sides.
    case grahamTops = "GT"

    /// Hills in England, Wales and Ireland at least 2000ft in height with a
    /// drop of at least 30m on all sides.
    case hewitts = "Hew"

    /// Hills in the Scottish Highlands at least 500m in height and below 609.6m
    /// in height with a drop of at least 30m on all sides.
    case highlandFives = "5H"

    /// Hills of any height with a drop of 100m or more on all sides.
    case humps = "Hu"

    /// The highest point within the boundary of each London borough as it has
    /// existed from some time in the 1990s.
    case londonBoroughs = "CoL"

    /// Hills of any height with a drop of 150m or more on all sides.
    case marilyns = "Ma"

    /// Hills in Scotland over 3000ft in height.
    case munros = "M"

    /// Subsidiary summits of Munros that meet the Munro height criterion.
    ///
    /// - SeeAlso: `HillList.Category.munros`
    case munroTops = "MT"

    /// Hills in Scotland at least 3000ft in height with a drop of at least 30m
    /// on all sides.
    case murdos = "Mur"

    /// Hills in Ireland at least 500m in height and below 609.6m in height with
    /// a drop of at least 30m on all sides.
    case myrddynDeweys = "5M"

    /// A reclassification of Donalds with a simplified drop criterion of 30m.
    ///
    /// - SeeAlso: `HillList.Category.donalds`
    case newDonalds = "DN"

    /// Hills in Ireland over 900m in height and with a prominence of at least
    /// 15m.
    case nineHundreds = "900s"

    /// Hills in England and Wales at least 2000ft in height with a drop of at
    /// least 15m on all sides, as published in
    /// [The Mountains of England and Wales](http://www.nuttalls.com/general/books.htm).
    case nuttalls = "N"

    /// Hills listed in Wainwright's *The Outlying Fells of Lakeland*.
    case outlyingFells = "WO"

    /// Hills in Britain and Ireland at least 600m in height with a drop of at
    /// least 30m on all sides.
    case simms = "Sim"

    /// Hills in the Lake District over 1000ft listed in *The Lakeland Summits*,
    /// published in 1995 by Tim Synges.
    case synges = "Sy"

    /// A list of [100 hills](http://www.livefortheoutdoors.com/trail100)
    /// published in *Trail* magazine in 2007.
    case trail100s = "T100"

    /// Hills in Ireland at least 600m in height with a drop of at least 15m on
    /// all sides.
    case vandeleurLynams = "VL"

    /// The 214 hills listed in volumes 1-7 of Wainwright's *A Pictorial Guide
    /// to the Lakeland Fells*.
    case wainwrights = "W"
  }

  /// An enumeration of geographical regions within Britain and Ireland to which
  /// hill lists can belong.
  public enum Region {
    /// For hill lists in England.
    case england

    /// For hill lists in the Republic of Ireland.
    case ireland

    /// For hill lists in the Isle of Man.
    case isleOfMan

    /// For hill lists in Northern Ireland.
    case northernIreland

    /// For hill lists in Scotland.
    case scotland

    /// For hill lists in, loosely speaking, the United Kingdom. There's
    /// arguably some inconsistency since some lists are split among the
    /// constituent nations of Great Britain or the United Kingdom while others
    /// aren't. The lists assigned to this 'region' may in fact contain no hills
    /// in some constituent countries. Read the
    /// [database notes](http://www.hills-database.co.uk/database_notes.html)
    /// of the Database of British and Irish Hills to see just how challenging
    /// it is to use countries (or Crown Dependencies in the case of the Isle of
    /// Man) for grouping.
    case unitedKingdom

    /// For hill lists in Wales.
    case wales
  }
}

extension HillList {
  /// Creates a hill list from the identifier used by the Hill Lists app. If the
  /// identifier is invalid the result is `nil`.
  ///
  /// - Note: this initializer simply delegates to the synthesized failable
  ///         initializer but provides a parameter label that hints at the
  ///         parameter's role.
  init?(id: Int) {
    self.init(rawValue: id)
  }
}

extension HillList {
  /// A type that encapsulates a non-geographical hill list (as defined by the
  /// `Category` type) and a geographical region (as defined by the `Region`
  /// type).
  fileprivate struct Detail {
    /// A static cache of instances of this type keyed by `HillList`, with one
    /// entry for each value of the `HillList` type.
    ///
    /// - Note: correct behaviour of the `HillList` type depends on an entry
    ///         being created in this cache for every enumeration value.
    static let detailsByHillListCache: [HillList: Detail] = [
      .corbetts: Detail(category: .corbetts, region: .scotland),
      .corbettTops: Detail(category: .corbettTops, region: .scotland),
      .donalds: Detail(category: .donalds, region: .scotland),
      .donaldTops: Detail(category: .donaldTops, region: .scotland),
      .grahams: Detail(category: .grahams, region: .scotland),
      .scottishHumps: Detail(category: .humps, region: .scotland),
      .scottishMarilyns: Detail(category: .marilyns, region: .scotland),
      .munros: Detail(category: .munros, region: .scotland),
      .munroTops: Detail(category: .munroTops, region: .scotland),
      .murdos: Detail(category: .murdos, region: .scotland),
      .newDonalds: Detail(category: .newDonalds, region: .scotland),
      .isleOfManHumps: Detail(category: .humps, region: .isleOfMan),
      .isleOfManMarilyns: Detail(category: .marilyns, region: .isleOfMan),
      .welshFurths: Detail(category: .furths, region: .wales),
      .welshHumps: Detail(category: .humps, region: .wales),
      .welshMarilyns: Detail(category: .marilyns, region: .wales),
      .birketts: Detail(category: .birketts, region: .england),
      .englishHumps: Detail(category: .humps, region: .england),
      .englishMarilyns: Detail(category: .marilyns, region: .england),
      .outlyingFells: Detail(category: .outlyingFells, region: .england),
      .wainwrights: Detail(category: .wainwrights, region: .england),
      .ukCountyTopsCurrent: Detail(category: .countyTopsCurrent, region: .unitedKingdom),
      .ukDeweys: Detail(category: .deweys, region: .unitedKingdom),
      .ukHewitts: Detail(category: .hewitts, region: .unitedKingdom),
      .nuttalls: Detail(category: .nuttalls, region: .unitedKingdom),
      .trail100s: Detail(category: .trail100s, region: .unitedKingdom),
      .carns: Detail(category: .carns, region: .northernIreland),
      .nineHundreds: Detail(category: .nineHundreds, region: .ireland),
      .arderins: Detail(category: .arderins, region: .northernIreland),
      .binnions: Detail(category: .binnions, region: .northernIreland),
      .vandeleurLynams: Detail(category: .vandeleurLynams, region: .northernIreland),
      .northernIrishCountyTopsCurrent: Detail(category: .countyTopsCurrent, region: .northernIreland),
      .donaldDeweys: Detail(category: .donaldDeweys, region: .scotland),
      .englishFurths: Detail(category: .furths, region: .england),
      .grahamTops: Detail(category: .grahamTops, region: .scotland),
      .northernIrishHewitts: Detail(category: .hewitts, region: .northernIreland),
      .highlandFives: Detail(category: .highlandFives, region: .scotland),
      .northernIrishHumps: Detail(category: .humps, region: .northernIreland),
      .northernIrishMarilyns: Detail(category: .marilyns, region: .northernIreland),
      .myrddynDeweys: Detail(category: .myrddynDeweys, region: .northernIreland),
      .scottishSimms: Detail(category: .simms, region: .scotland),
      .isleOfManSimms: Detail(category: .simms, region: .isleOfMan),
      .welshSimms: Detail(category: .simms, region: .wales),
      .fellrangers: Detail(category: .fellrangers, region: .england),
      .englishSimms: Detail(category: .simms, region: .england),
      .synges: Detail(category: .synges, region: .england),
      .northernIrishSimms: Detail(category: .simms, region: .northernIreland),
      .londonBoroughs: Detail(category: .londonBoroughs, region: .england),
      .dillons: Detail(category: .dillons, region: .northernIreland),
      .bridges: Detail(category: .bridges, region: .unitedKingdom),
      .buxtonAndLewis: Detail(category: .buxtonAndLewis, region: .unitedKingdom),
      .ukCountyTopsHistorical: Detail(category: .countyTopsHistorical, region: .unitedKingdom),
      .northernIrishCountyTopsHistorical: Detail(category: .countyTopsHistorical, region: .northernIreland),
      .countyTopsAdministrative: Detail(category: .countyTopsAdministrative, region: .unitedKingdom)
    ]

    /// Returns the cached details of a hill list.
    ///
    /// - Parameter hillList: a hill list for which details are required.
    static func getDetail(hillList: HillList) -> Detail? {
      return detailsByHillListCache[hillList]
    }

    /// The name used by the app for the hill list described by this detail
    /// object.
    let category: Category

    /// The region used by the app for grouping the hill list described by this
    /// detail object.
    let region: Region

    /// Creates a new details object for a hill list.
    ///
    /// - Parameters:
    ///   - name: the name of a hill list category.
    ///   - region: the geographical region of a hill list.
    private init(category: Category, region: Region) {
      self.category = category
      self.region = region
    }
  }
}

/// Extension allowing properties of the raw type to be accessed as if they were
/// properties of the `HillList` enum.
extension HillList {
  /// Returns the identifier used by the app for this hill list.
  public var id: Int {
    return self.rawValue
  }

  /// Returns the category of this hill list.
  public var category: Category {
    return Detail.getDetail(hillList: self)!.category
  }

  /// Returns the geographical region of this hill list.
  public var region: Region {
    return Detail.getDetail(hillList: self)!.region
  }
}

//----------------------------------------------------------------------------//
//
// MARK: - CustomStringConvertible

extension HillList: CustomStringConvertible {
  /// :nodoc:
  public var description: String {
    return "HillList{id: \(id), category: \(category), region: \(region)}"
  }
}
