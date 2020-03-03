
//
//  GoodsModel.swift
//  ZXOrderMenu
//
//  Created by Mr.Zhu on 2020/2/28.
//  Copyright © 2020 apple. All rights reserved.
//
import UIKit

class LeftTitleModel: NSObject {
    var name = ""
    var image: UIImage?
    var sort = 0
}

class GoodsModel: NSObject {
    ///商品名称
    var name = ""
    ///标签
    var tags = [Tag]()
    ///月销
    var monthSale = 0
    ///现价
    var currentpPrice = 0.0
    ///原价
    var originPrice = 0.0
    ///购买个数
    var buyNum: Int {
        return _buyNum
    }
    var image: UIImage?
    
    ///单位
    var unit = ""
    
    func addOne(){
        _buyNum += 1
    }
    
    func removeOne(){
        _buyNum -= 1
    }
    
    func SetGoodsNumber(_ number: Int) {
        _buyNum = number
    }
    
    private var _buyNum = 0
}

class Tag: NSObject {
    var name = ""
    var image: UIImage?
}
