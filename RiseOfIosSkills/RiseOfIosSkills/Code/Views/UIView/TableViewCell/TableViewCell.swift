//
//  TableViewCell.swift
//  RiseOfIosSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.


import UIKit

final class TableViewCell: UITableViewCell {
  
  // MARK - Outlets
  
  @IBOutlet weak var ibTitleLabel: UILabel!
  
  // MARK - Initializers
  
  // MARK - Overrides
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    self.ibTitleLabel.text = "UITableViewCells are the best !! 🎉"
  }
}

