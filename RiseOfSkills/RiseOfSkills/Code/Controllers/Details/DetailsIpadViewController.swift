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
    menuDetailsViewController.view.frame.size = self.ibLeftViewContainer.bounds.size
    menuDetailsViewController.ibBackgroundView.frame.size = self.ibLeftViewContainer.bounds.size
    
    menuDetailsViewController.willMove(toParentViewController: self)
    self.addChildViewController(menuDetailsViewController)
    self.ibLeftViewContainer.addSubview(menuDetailsViewController.view)
    menuDetailsViewController.didMove(toParentViewController: self)
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
