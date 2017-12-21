// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable identifier_name line_length type_body_length
enum L10n {
  /// Characters
  static let characters = L10n.tr("Localizable", "characters")
  /// Episode %d released in %d
  static func detailsFilmSubtitle(_ p1: Int, _ p2: Int) -> String {
    return L10n.tr("Localizable", "detailsFilmSubtitle", p1, p2)
  }
  /// Films
  static let films = L10n.tr("Localizable", "films")
  /// Menu
  static let menu = L10n.tr("Localizable", "menu")
  /// Planets
  static let planets = L10n.tr("Localizable", "planets")
  /// Species
  static let species = L10n.tr("Localizable", "species")
  /// Starships
  static let starships = L10n.tr("Localizable", "starships")
  /// Vehicules
  static let vehicules = L10n.tr("Localizable", "vehicules")
}
// swiftlint:enable identifier_name line_length type_body_length

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
