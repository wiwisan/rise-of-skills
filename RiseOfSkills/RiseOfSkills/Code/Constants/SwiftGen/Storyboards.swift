// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

// swiftlint:disable sorted_imports
import Foundation
import UIKit

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

protocol StoryboardType {
  static var storyboardName: String { get }
}

extension StoryboardType {
  static var storyboard: UIStoryboard {
    let name = self.storyboardName
    return UIStoryboard(name: name, bundle: Bundle(for: BundleToken.self))
  }
}

struct SceneType<T: Any> {
  let storyboard: StoryboardType.Type
  let identifier: String

  func instantiate() -> T {
    let identifier = self.identifier
    guard let controller = storyboard.storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
      fatalError("ViewController '\(identifier)' is not of the expected class \(T.self).")
    }
    return controller
  }
}

struct InitialSceneType<T: Any> {
  let storyboard: StoryboardType.Type

  func instantiate() -> T {
    guard let controller = storyboard.storyboard.instantiateInitialViewController() as? T else {
      fatalError("ViewController is not of the expected class \(T.self).")
    }
    return controller
  }
}

protocol SegueType: RawRepresentable { }

extension UIViewController {
  func perform<S: SegueType>(segue: S, sender: Any? = nil) where S.RawValue == String {
    let identifier = segue.rawValue
    performSegue(withIdentifier: identifier, sender: sender)
  }
}

// swiftlint:disable explicit_type_interface identifier_name line_length type_body_length type_name
enum StoryboardScene {
  enum Details: StoryboardType {
    static let storyboardName = "Details"

    static let detailsCollectionViewController = SceneType<RiseOfSkills.DetailsCollectionViewController>(storyboard: Details.self, identifier: "detailsCollectionViewController")

    static let detailsCoverViewController = SceneType<RiseOfSkills.DetailsCoverViewController>(storyboard: Details.self, identifier: "detailsCoverViewController")

    static let detailsIpadViewController = SceneType<RiseOfSkills.DetailsIpadViewController>(storyboard: Details.self, identifier: "detailsIpadViewController")

    static let detailsViewController = SceneType<RiseOfSkills.DetailsViewController>(storyboard: Details.self, identifier: "detailsViewController")
  }
  enum LaunchScreen: StoryboardType {
    static let storyboardName = "LaunchScreen"

    static let initialScene = InitialSceneType<UIViewController>(storyboard: LaunchScreen.self)
  }
  enum Menu: StoryboardType {
    static let storyboardName = "Menu"

    static let initialScene = InitialSceneType<UINavigationController>(storyboard: Menu.self)

    static let menuDetailsViewController = SceneType<RiseOfSkills.MenuDetailsViewController>(storyboard: Menu.self, identifier: "MenuDetailsViewController")

    static let menuViewController = SceneType<RiseOfSkills.MenuViewController>(storyboard: Menu.self, identifier: "MenuViewController")
  }
}

enum StoryboardSegue {
}
// swiftlint:enable explicit_type_interface identifier_name line_length type_body_length type_name

private final class BundleToken {}
