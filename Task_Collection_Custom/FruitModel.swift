//
//  FruitModel.swift
//  Task_Collection_Custom
//
//  Created by Esraa Khaled   on 04/09/2022.
//

import UIKit

struct FruitModel {
  var fruitImage: UIImage
  var fruitName: String
  var fruitKilo: String
  var fruitPrice: String
 
  
  init(fruitImage: UIImage,  fruitName: String,fruitKilo: String,fruitPrice: String) {
    self.fruitImage = fruitImage
    self.fruitName = fruitName
    self.fruitKilo = fruitKilo
    self.fruitPrice = fruitPrice
   
  }
    init?(dictionary: [String: String]) {
      guard
       
        let name = dictionary["Name"],
        let kilo = dictionary["Kilo"],
        let price = dictionary["Price"],
        let photo = dictionary["Photo"],
        let image = UIImage(named: photo)
        else {
          return nil
      }
      self.init(fruitImage: image,  fruitName: name,fruitKilo: kilo,fruitPrice: price)
    }

    static func allPhotos() -> [FruitModel] {
      var fruits: [FruitModel] = []
      guard
        let URL = Bundle.main.url(forResource: "Fruits", withExtension: "plist"),
        let photosFromPlist = NSArray(contentsOf: URL) as? [[String: String]]
        else {
          return fruits
      }
      for dictionary in photosFromPlist {
        if let photo = FruitModel(dictionary: dictionary) {
          fruits.append(photo)
        }
      }
      return fruits
    }
}

  
  
