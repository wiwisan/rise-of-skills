//
//  MenuDetailsTableViewCell.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.
//

import UIKit

final class MenuDetailsTableViewCell: UITableViewCell {
  
  // MARK - Outlets
  
  @IBOutlet weak var ibTitleLabel: UILabel!
  @IBOutlet weak var ibDescriptionLabel: UILabel!
  
  // MARK - Initializers
  
  // MARK - Overrides
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    self.contentView.backgroundColor = .clear
    self.ibTitleLabel.textColor = .white
    self.ibTitleLabel.font = UIFont(name: "Avenir Book", size: 30)
    self.ibDescriptionLabel.textColor = UIColor(white: 1, alpha: 0.5)
    self.ibDescriptionLabel.font = UIFont(name: "Avenir Book", size: 24)
  }
}
