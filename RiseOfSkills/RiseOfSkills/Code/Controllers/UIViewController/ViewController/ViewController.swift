//
//  ViewController.swift
//  RiseOfIosSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.


import Foundation
import UIKit
import Alamofire
import RealmSwift

final class ViewController: UIViewController {
  
  // MARK - Outlets
  
  @IBOutlet weak var ibContainerView: UIView!
  @IBOutlet weak var ibTitleLabel: UILabel!
  
  // MARK - Initializers
  
  // MARK - Overrides
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.ibTitleLabel.text = "Hi ! I'm a UIViewController! That's coool 😎"
  }
}
