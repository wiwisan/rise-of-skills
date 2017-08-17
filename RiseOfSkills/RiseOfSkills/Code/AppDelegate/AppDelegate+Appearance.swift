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
    let backgroundColor = self.hexStringToUIColor(hex: "#00BAFF")
    appearance.tintColor = .white
    appearance.barTintColor = backgroundColor
    appearance.setBackgroundImage(UIImage(), for: .default)
    appearance.shadowImage = UIImage()
    
    let font = UIFont(name: "Avenir Book", size: 24)
    let titleTextAttributes: [String: Any] = [NSForegroundColorAttributeName: UIColor.white,
                                              NSFontAttributeName: font ?? .systemFont(ofSize: 24)]
    appearance.titleTextAttributes = titleTextAttributes
  }
  
  func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
      cString.remove(at: cString.startIndex)
    }
    
    if ((cString.characters.count) != 6) {
      return UIColor.gray
    }
    
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    return UIColor(
      red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
      green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
      blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
      alpha: CGFloat(1.0)
    )
  }
}
