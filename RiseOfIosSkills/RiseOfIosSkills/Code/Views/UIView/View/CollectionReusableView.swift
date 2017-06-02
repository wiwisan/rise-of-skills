//
//  CollectionReusableView.swift
//  RiseOfIosSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.

import UIKit

final class CollectionReusableView: UICollectionReusableView {
  
  // MARK - Outlets
  
  @IBOutlet weak var ibContainerView: UIView!
  @IBOutlet weak var ibTitleLabel: UILabel!
  
  // MARK - Initializers
  
  // MARK - Overrides
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    self.ibTitleLabel.text = "UICollectionReusableView is here !! 🎉"
  }
}
