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
  
  var childViewController: UIViewController?
  var parentViewController: UIViewController?
  
  // MARK - Overrides
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
  }
  
  // MARK - Internal Methods
  
  func configure(withParent parent: UIViewController, data: Object) {
    if self.childViewController == nil, self.parentViewController == nil {
      
      let storyBoard : UIStoryboard = UIStoryboard(name: "Details", bundle:nil)
      guard let detailsViewController = storyBoard.instantiateViewController(withIdentifier: "detailsViewController") as? DetailsViewController else {
        fatalError("Could not instantiate viewController with identifier: detailsViewController")
      }
      detailsViewController.detail = data
      
      detailsViewController.willMove(toParentViewController: parent)
      // Set variables
      self.childViewController = detailsViewController
      self.parentViewController = parent
      
      parent.addChildViewController(detailsViewController)
      self.contentView.addSubview(detailsViewController.view)
      detailsViewController.didMove(toParentViewController: parent)
    }
  }
}
