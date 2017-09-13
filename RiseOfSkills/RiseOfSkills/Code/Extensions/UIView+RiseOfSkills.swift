//
//  UIView+RiseOfSkills.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
  
  func setGradientBackground() {
    let colorTop =  UIColor.init(hexString: "#21D0FD").cgColor
    let colorBottom = UIColor.init(hexString: "#EE4DB9").cgColor
    
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [ colorTop, colorBottom]
    gradientLayer.locations = [ 0.0, 1.0]
    if let parentView = self.superview {
      gradientLayer.frame = parentView.bounds
    } else {
      gradientLayer.frame = self.bounds
    }
    
    self.layer.addSublayer(gradientLayer)
  }
}
