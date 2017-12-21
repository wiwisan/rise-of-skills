//
//  DetailsCoverViewControler.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.
//

import UIKit

final class DetailsCoverViewController : UIViewController {
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationController?.navigationItem.backBarButtonItem = nil
    //
  }
  
  @IBAction func flipView(_ sender: UIButton) {
    UIView.transition(with: self.navigationController!.view, duration: 1.0, options: .transitionFlipFromLeft, animations: {
      self.navigationController?.popViewController(animated: false)
    }, completion: nil)
  }
}
