//
//  DetailsIpadViewController.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.
//

import UIKit
import RealmSwift

final class DetailsIpadViewController: UIViewController {
  
  @IBOutlet weak var ibLeftViewContainer: UIView!
  @IBOutlet weak var ibRightViewContainer: UIView!
  
  var details: [Object] = []
  var item: MenuItem?
  var iPadDetailsViewController: DetailsViewController?
  
  // MARK: Overrides
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.configureRightContainer()
    self.configureLeftContainer()
  }
  
  func configureLeftContainer() {
    let storyBoard : UIStoryboard = UIStoryboard(name: "Menu", bundle:nil)
    guard let menuDetailsViewController = storyBoard.instantiateViewController(withIdentifier: "MenuDetailsViewController") as? MenuDetailsViewController else {
      fatalError("Could not instantiate viewController with identifier: menuDetailsViewController")
    }
    menuDetailsViewController.item = self.item
    menuDetailsViewController.iPadDetailsViewController = self.iPadDetailsViewController
//    menuDetailsViewController.view.frame.size = self.ibLeftViewContainer.bounds.size
//    menuDetailsViewController.ibBackgroundView.frame.size = self.ibLeftViewContainer.bounds.size
    
    
    menuDetailsViewController.willMove(toParentViewController: self)
    self.addChildViewController(menuDetailsViewController)
    self.ibLeftViewContainer.addSubview(menuDetailsViewController.view)
    menuDetailsViewController.didMove(toParentViewController: self)
    
    
//    var viewConstraints = [NSLayoutConstraint]()
//    let views: [String: UIView] = ["menuDetailsView" : menuDetailsViewController.view, "menuDetailsViewbackground" : menuDetailsViewController.ibBackgroundView]
//    let menuDetailsViewConstraints = NSLayoutConstraint.constraints(withVisualFormat: "|-0-[menuDetailsView]-0-|", options: [], metrics: nil, views: views)
//    viewConstraints += menuDetailsViewConstraints
//    let menuDetailsViewbackgroundConstraints = NSLayoutConstraint.constraints(withVisualFormat:  "|-[menuDetailsViewbackground]-|", options: [], metrics: nil, views: views)
//    viewConstraints += menuDetailsViewbackgroundConstraints
    
    
    let leading = NSLayoutConstraint(item: menuDetailsViewController.view, attribute: .leading, relatedBy: .equal, toItem: self.ibLeftViewContainer, attribute: .leading, multiplier: 1.0, constant: 0)
    let trailing = NSLayoutConstraint(item: menuDetailsViewController.ibBackgroundView, attribute: .trailing, relatedBy: .equal, toItem: self.ibLeftViewContainer, attribute: .trailing, multiplier: 1.0, constant: 0)

    self.ibLeftViewContainer.addConstraint(leading)
    self.ibLeftViewContainer.addConstraint(trailing)
  }
  
  func configureRightContainer() {
    let storyBoard : UIStoryboard = UIStoryboard(name: "Details", bundle:nil)
    guard let detailsViewController = storyBoard.instantiateViewController(withIdentifier: "detailsViewController") as? DetailsViewController else {
      fatalError("Could not instantiate viewController with identifier: detailsViewController")
    }
    
    detailsViewController.view.frame.size = self.ibRightViewContainer.bounds.size
    self.iPadDetailsViewController = detailsViewController
    
    detailsViewController.willMove(toParentViewController: self)
    self.addChildViewController(detailsViewController)
    self.ibRightViewContainer.addSubview(detailsViewController.view)
    detailsViewController.didMove(toParentViewController: self)
  }
  
}
