//
//  UITableViewController+RiseOfSkills.swift
//  RiseOfSkills
//
//  Created by Wildine Anthony on 31/08/2017.
//  Copyright © 2017 Wildine Anthony. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
  
  func setBackground() {
    let colorTop =  UIColor.init(hexString: "#21D0FD").cgColor
    let colorBottom = UIColor.init(hexString: "#EE4DB9").cgColor
    
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [ colorTop, colorBottom]
    gradientLayer.locations = [ 0.0, 1.0]
    gradientLayer.frame = self.bounds
    
//    let backgroundView = UIView(frame: self.bounds)
    self.backgroundView?.layer.insertSublayer(gradientLayer, at: 0)
    
//    return backgroundView
  }
}
