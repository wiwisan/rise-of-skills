//
//  PageViewController.swift
//  RiseOfSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.
//

import UIKit

final class DetailsCollectionViewController: UICollectionViewController {
  
  // MARK: Properties
  
  @IBOutlet weak var ibCollectionView: UICollectionView!
  
  // MARK: Overrides
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.ibCollectionView.register(DetailsCollectionViewCell.self, forCellWithReuseIdentifier: "detailsCollectionViewCell")
    self.ibCollectionView.isPagingEnabled = true
  }
  
  // MARK: Internal Methods
  
  func configureCell(withViewController controller: UIViewController, forContentView view: UIView) {
    self.addChildViewController(controller)
    controller.view.frame = self.ibCollectionView.bounds
    view.addSubview(controller.view)
    controller.didMove(toParentViewController: self)
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 3
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cellIdentifier = "detailsCollectionViewCell"
    guard let cell = self.ibCollectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? DetailsCollectionViewCell else {
      fatalError("Oh No 😯! Unable to dequeue cell with identifier: \(cellIdentifier). ☹️")
    }
    
    let storyBoard : UIStoryboard = UIStoryboard(name: "Details", bundle:nil)
    guard let detailsViewController = storyBoard.instantiateViewController(withIdentifier: "detailsViewController") as? DetailsViewController else {
      fatalError("Could not instantiate viewController with identifier: detailsViewController")
    }
    self.configureCell(withViewController: detailsViewController, forContentView: cell.contentView)

    return cell
  }
}

extension DetailsCollectionViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return self.ibCollectionView.bounds.size
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsetsMake(0, 0, 0, 0)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
}
