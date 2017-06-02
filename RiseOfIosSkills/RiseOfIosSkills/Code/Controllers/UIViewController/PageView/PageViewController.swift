//
//  PageViewController.swift
//  RiseOfIosSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.


import UIKit

final class PageViewController: UIPageViewController {
  
  // MARK - Outlets

  // MARK - Initializers
  
  var controllers: [UIViewController] = []
  let numberOfControllers = 3
  
  // MARK - Overrides
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Add view controllers
    let storyboard = UIStoryboard(name: "ViewController", bundle: nil)
    let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController")
    let collectionViewController = storyboard.instantiateViewController(withIdentifier: "CollectionViewController")
    let tableViewController = storyboard.instantiateViewController(withIdentifier: "TableViewController")
    
    self.controllers.append(collectionViewController)
    self.controllers.append(tableViewController)
    self.controllers.append(viewController)
    
    self.setViewControllers([self.controllers[0]], direction: .forward, animated: true, completion: nil)
  }
}

// MARK - UIPageViewControllerDataSource
extension PageViewController: UIPageViewControllerDataSource {
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    guard let currentIndex = self.controllers.index(of: viewController) else {
      fatalError("Unable to find \(viewController) in the data source.")
    }
    if currentIndex > 0 {
      let previousIndex = currentIndex - 1
      return self.controllers[previousIndex]
    }
    return nil
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    guard let currentIndex = self.controllers.index(of: viewController) else {
      fatalError("Unable to find \(viewController) in the data source.")
    }
    if currentIndex >= 0, currentIndex < self.controllers.count - 1 {
      let nextIndex = currentIndex + 1
      return self.controllers[nextIndex]
    }
    return nil
  }
}

// MARK - UIPageViewControllerDelegate
extension PageViewController: UIPageViewControllerDelegate {
  // Delegate methods here
}
