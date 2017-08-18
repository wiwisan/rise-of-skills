//
//  AppDelegate+Appearance.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.
//

import UIKit

extension AppDelegate {
  
  // MARK: - Internal methods

  func configureAppearance(application: UIApplication) {
    self.configureNavigationBar()
  }
  
  // MARK: - Private methods
  
  private func configureNavigationBar() {
    let appearance = UINavigationBar.appearance()
    appearance.barStyle = UIBarStyle.black
    appearance.isTranslucent = false
    let backgroundColor = UIColor.init(hexString: "#00BAFF")
    appearance.tintColor = .white
    appearance.barTintColor = backgroundColor
    appearance.setBackgroundImage(UIImage(), for: .default)
    appearance.shadowImage = UIImage()
    
    let font = UIFont(name: "Avenir Book", size: 24)
    let titleTextAttributes: [String: Any] = [NSForegroundColorAttributeName: UIColor.white,
                                              NSFontAttributeName: font ?? .systemFont(ofSize: 24)]
    appearance.titleTextAttributes = titleTextAttributes
  }
}
