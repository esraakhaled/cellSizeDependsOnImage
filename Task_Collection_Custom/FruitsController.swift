//
//  ViewController.swift
//  Task_Collection_Custom
//
//  Created by Esraa Khaled   on 04/09/2022.
//

import UIKit
import AVFoundation

class FruitsController: UIViewController {
    
   @IBOutlet weak var collectionView: UICollectionView!
    var fruits = FruitModel.allPhotos()
    override var preferredStatusBarStyle: UIStatusBarStyle {
      return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let layout = collectionView?.collectionViewLayout as? FruitLayout {
          layout.delegate = self
        
        }
        
        collectionView?.backgroundColor = .clear
        collectionView?.contentInset = UIEdgeInsets(top: 23, left: 16, bottom: 10, right: 16)
        collectionView.dataSource = self
        
    }


}

extension FruitsController: UICollectionViewDelegateFlowLayout{
    
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return fruits.count
  }
  
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FruitCell.reuseIdentifier, for: indexPath as IndexPath) as! FruitCell
    cell.fruit = fruits[indexPath.item]
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
    return CGSize(width: itemSize, height: itemSize)
  }
}
extension FruitsController: FruitLayoutDelegate {
  func collectionView(
      _ collectionView: UICollectionView,
      heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
          return fruits[indexPath.item].fruitImage.size.height
  }
}
extension FruitsController: UICollectionViewDataSource {
    
}
