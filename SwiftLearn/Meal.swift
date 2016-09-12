//
//  Meal.swift
//  SwiftLearn
//
//  Created by SupingLi on 16/9/10.
//  Copyright © 2016年 SupingLi. All rights reserved.
//

import Foundation
import UIKit

class Meal:NSObject, NSCoding {
    
    // MARK: proprities
    
    var name:String
    var photo:UIImage?
    var rating:Int
    
    // MARK: Archiving Paths
    
    static let documentDir = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let archiveUrl = documentDir.URLByAppendingPathComponent("meals")
    
    struct properityKey {
        static let nameKey = "name"
        static let photoKey = "photo"
        static let ratingKey = "rating"
    }
    
    // MARK: NSCoding
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey:properityKey.nameKey)
        aCoder.encodeObject(photo, forKey:properityKey.photoKey)
        aCoder.encodeInteger(rating, forKey: properityKey.ratingKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(properityKey.nameKey) as!String
        let photo = aDecoder.decodeObjectForKey(properityKey.photoKey) as?UIImage
        let rating = aDecoder.decodeIntegerForKey(properityKey.ratingKey)
        self.init(name:name, photo:photo, rating:rating)
    }
    
    
    // MARK:Init
    
    init?(name:String, photo:UIImage?, rating:Int) {
        self.name = name
        self.photo = photo
        self.rating = rating
        super.init()
        if name.isEmpty || rating < 0 {
            return nil
        }
        
    }
    
    
}
