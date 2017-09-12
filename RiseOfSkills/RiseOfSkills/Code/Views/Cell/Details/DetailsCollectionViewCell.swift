//
//  DetailsCollectionViewCell.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.
//

import UIKit
import RealmSwift

final class DetailsCollectionViewCell: UICollectionViewCell {
  
  // MARK - Outlets
  
  
  // MARK - Initializers
  var detailsViewController: DetailsViewController?
  
  // MARK - Overrides
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  // MARK - Internal Methods
  
  func configure(withParent parent: UIViewController, data: Object) {
    if self.detailsViewController == nil {
      
      let storyBoard : UIStoryboard = UIStoryboard(name: "Details", bundle:nil)
      guard let detailsViewController = storyBoard.instantiateViewController(withIdentifier: "detailsViewController") as? DetailsViewController else {
        fatalError("Could not instantiate viewController with identifier: detailsViewController")
      }
      self.detailsViewController = detailsViewController
      
      if let childViewController = self.detailsViewController {
        childViewController.willMove(toParentViewController: parent)
        parent.addChildViewController(childViewController)
        self.contentView.addSubview(childViewController.view)
        childViewController.didMove(toParentViewController: parent)
      }
    }
    self.detailsViewController?.detail = data
  }
}
