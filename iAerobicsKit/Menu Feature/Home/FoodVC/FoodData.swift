//
//  FoodData.swift
//  iHealthS
//
//  Created by Apple on 2019/4/6.
//  Copyright © 2019年 whitelok.com. All rights reserved.
//

import UIKit

struct FoodData {
    static var url = "http://47.75.131.189/4716686ae308dfacacea2ed413f869ad/"
    static var titleAPI = ["type":"title"]
    static var cookingList = [FoodModel]()
    static var collectionList = [FoodModel]()
    static var cookingLoad = false
    static var collection = [String]()
}
