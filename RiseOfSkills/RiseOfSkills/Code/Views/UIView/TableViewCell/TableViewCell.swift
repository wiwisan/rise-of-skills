//
//  TableViewCell.swift
//  RiseOfIosSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.


import UIKit

protocol TableViewCellDelegate: class {
  func goToView()
}

final class TableViewCell: UITableViewCell {
  
  // MARK - Outlets
  
  @IBOutlet weak var ibMenuImage: UIImageView!
  @IBOutlet weak var ibMenuTitle: UILabel!
  @IBOutlet weak var ibMenuItemEmoji: UILabel!
  
  // MARK - Initializers
  
  weak var tableViewCellDelegate: TableViewCellDelegate?
  
  // MARK - Overrides
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    self.ibMenuTitle.textColor = .white
    self.ibMenuTitle.font = UIFont(name: "Avenir Book", size: 40)
    self.ibMenuItemEmoji.textColor = .white
    self.ibMenuItemEmoji.font = UIFont(name: "Avenir Light", size: 15)
  }
  
  @IBAction func goToViewTouchUpInside(_ sender: UIButton) {
    self.tableViewCellDelegate?.goToView()
  }
}
