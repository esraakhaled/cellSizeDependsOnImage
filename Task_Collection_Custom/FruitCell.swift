//
//  FruitCell.swift
//  Task_Collection_Custom
//
//  Created by Esraa Khaled   on 04/09/2022.
//

import UIKit

class FruitCell: UICollectionViewCell {
    
    static let reuseIdentifier = "FruitCell"
    
    @IBOutlet weak var fruitImage: UIImageView!
    
    @IBOutlet weak var fruitName: UILabel!
    
    @IBOutlet weak var fruitPrice: UILabel!
    
    @IBOutlet weak var fruitPriceValue: UILabel!
    @IBOutlet weak var view: UIView!
    
    override func awakeFromNib() {
      super.awakeFromNib()
     contentView.layer.cornerRadius = 15
     contentView.layer.masksToBounds = true
      view.layer.cornerRadius = 15
      view.layer.masksToBounds = true
//      lineView.layer.borderWidth = 0.25
//      lineView.layer.borderColor = UIColor.gray.cgColor
      
    }
    
   var fruit: FruitModel? {
     didSet {
        if let fruit = fruit {
            fruitImage.image = fruit.fruitImage
            fruitName.text = fruit.fruitName
            fruitPrice.text = fruit.fruitKilo
            fruitPriceValue.text = fruit.fruitPrice
        }
     }
}
}
