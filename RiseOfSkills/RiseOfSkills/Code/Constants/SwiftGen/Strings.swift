// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
enum L10n {

  enum Details {

    enum Films {
      /// Episode %d released in %@
      static func listSubtitle(_ p1: Int, _ p2: String) -> String {
        return L10n.tr("Localizable", "details.films.listSubtitle", p1, p2)
      }
    }
  }

  enum Menu {

    enum Icon {
      /// 👨🏻
      static let characters = L10n.tr("Localizable", "menu.icon.characters")
      /// 🎥
      static let films = L10n.tr("Localizable", "menu.icon.films")
      /// 🌏
      static let planets = L10n.tr("Localizable", "menu.icon.planets")
      /// 👽
      static let species = L10n.tr("Localizable", "menu.icon.species")
      /// 🚀
      static let starships = L10n.tr("Localizable", "menu.icon.starships")
      /// 🚡
      static let vehicules = L10n.tr("Localizable", "menu.icon.vehicules")
    }

    enum Title {
      /// Characters
      static let characters = L10n.tr("Localizable", "menu.title.characters")
      /// Movies
      static let films = L10n.tr("Localizable", "menu.title.films")
      /// Menu
      static let menu = L10n.tr("Localizable", "menu.title.menu")
      /// Planets
      static let planets = L10n.tr("Localizable", "menu.title.planets")
      /// Species
      static let species = L10n.tr("Localizable", "menu.title.species")
      /// Starships
      static let starships = L10n.tr("Localizable", "menu.title.starships")
      /// Vehicules
      static let vehicules = L10n.tr("Localizable", "menu.title.vehicules")
    }
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
