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
    
    self.ibCollectionView.delegate = self
    self.ibCollectionView.dataSource = self
   
//    self.ibCollectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "collectionViewCell")
//    self.ibCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellReuseIdentifier: "collectionViewCell")
    
    self.ibCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionViewCell")
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
      fatalError("")
    }
    return cell
  }
}

// MARK - UICollectionViewDelegate
extension CollectionViewController: UICollectionViewDelegate {
  // Delegate methods here
}
