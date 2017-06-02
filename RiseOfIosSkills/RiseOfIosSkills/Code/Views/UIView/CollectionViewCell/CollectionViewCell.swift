//
//  CollectionViewCell.swift
//  RiseOfIosSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.


import UIKit

final class CollectionViewCell: UICollectionViewCell {
  
  // MARK - Outlets
  
  @IBOutlet weak var ibContainerView: UIView!
  @IBOutlet weak var ibTitleLabel: UILabel!
  
  // MARK - Initializers
  
  // MARK - Overrides
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    self.ibTitleLabel.text = "UICollectionViewCells I am, and i'm so great.. 😏"
  }
}
