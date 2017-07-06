//
//  CollectionViewController.swift
//  RiseOfIosSkills
//
//  Copyright © 2017 Wildine Anthony. All rights reserved.


import Foundation
import UIKit

final class CollectionViewController: UIViewController {
  
  // MARK - Outlets
  
  @IBOutlet var ibCollectionView: UICollectionView!
  
  // MARK - Initializers
  
  let numberOfItems = 3
  
  // MARK - Overrides
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.ibCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionViewCell")
    self.ibCollectionView.register(UINib(nibName: "CollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "collectionReusableView")
    
    self.ibCollectionView.isPagingEnabled = true
    self.ibCollectionView.showsHorizontalScrollIndicator = false
  }
}

// MARK - UICollectionViewDataSource
extension CollectionViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.numberOfItems
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cellIdentifier = "collectionViewCell"
    
    guard let cell = self.ibCollectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? CollectionViewCell else {
      fatalError("Oh No 😯! Unable to dequeue cell with identifier: \(cellIdentifier). ☹️")
    }
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let viewIdentifier = "collectionReusableView"
    var reusableView : UICollectionReusableView? = nil
    
    switch kind {
    case UICollectionElementKindSectionHeader:
      let view = self.ibCollectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: viewIdentifier, for: indexPath)
      reusableView = view
    default:
      print("Unable to find element of kind \(kind).")
    }
    
    guard let headerView = reusableView else {
      fatalError("Oh No 😯! Unable to dequeue view with identifier: \(viewIdentifier). ☹️")
    }
    
    return headerView
  }
}

// MARK - UICollectionViewDelegate
extension CollectionViewController: UICollectionViewDelegate {
  // Delegate methods here
}

// MARK - UICollectionViewDelegateFlowLayout
extension CollectionViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return collectionView.bounds.size
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsetsMake(0, 0, 0, 0)
  }
  
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//    return CGSize(width: self.view.frame.width, height: 100)
//  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
}
