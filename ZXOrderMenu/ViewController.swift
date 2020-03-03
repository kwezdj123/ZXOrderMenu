//
//  ViewController.swift
//  ZXOrderMenu
//
//  Created by apple on 2020/2/26.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
//        view.addSubview(scrollView)
        view.addSubview(_navigationView)
        
        NSLayoutConstraint(item: _navigationView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .top,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: _navigationView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: _navigationView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .width,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: _navigationView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: navigationHeight).isActive = true
        
        
//        NSLayoutConstraint(item: scrollView,
//                           attribute: .top,
//                           relatedBy: .equal,
//                           toItem: view,
//                           attribute: .top,
//                           multiplier: 1,
//                           constant: 0).isActive = true
//
//        NSLayoutConstraint(item: scrollView,
//                           attribute: .centerX,
//                           relatedBy: .equal,
//                           toItem: view,
//                           attribute: .centerX,
//                           multiplier: 1,
//                           constant: 0).isActive = true
//
//        NSLayoutConstraint(item: scrollView,
//                           attribute: .width,
//                           relatedBy: .equal,
//                           toItem: view,
//                           attribute: .width,
//                           multiplier: 1,
//                           constant: 0).isActive = true
//
//        NSLayoutConstraint(item: scrollView,
//                           attribute: .height,
//                           relatedBy: .equal,
//                           toItem: view,
//                           attribute: .height,
//                           multiplier: 1,
//                           constant: 0).isActive = true
        
        view.addSubview(shopBack)
        
        for index in 1...5{
            let model = GoodsModel()
            model.name = "第\(index)个商品"
            model.currentpPrice = Double(index*10+20)
            model.originPrice = Double(index*5+20)-5
            model.unit = "包"
            for tagIndex in 1...index{
                let tag = Tag()
                tag.name = "\(tagIndex)等好"
                model.tags.append(tag)
            }
            list.append(model)
        }
        
        var dataList = [LeftTitleModel: [GoodsModel]]()
        for index in 1...3{
            let lt = LeftTitleModel()
            lt.sort = index
            lt.name = "系列\(index)"
            dataList[lt] = list
        }
        
        shopBack.setList(dataList)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        scrollView.layoutIfNeeded()
        scrollView.contentSize.height = mainTableView.frame.origin.y + mainTableView.frame.size.height
        print("scrollView.contentSize.height:\(scrollView.contentSize.height)")
    }
    
    private lazy var _navigationView: NavigationView = {
        let nav = NavigationView()
        nav.translatesAutoresizingMaskIntoConstraints = false
        return nav
    }()
    
    private lazy var shopBack: ShopBackView = {
        let shopBack = ShopBackView(frame: CGRect(x: 0, y: navigationHeight, width: SCREENWIDTH, height: SCREENHEIGHT-navigationHeight))
        return shopBack
    }()
    
    private lazy var shopDetail: ShopDetail = {
//        let shopD = ShopDetail(frame: CGRect(origin: CGPoint(x: 0, y: navigationHeight+30), size: CGSize(width: SCREENWIDTH, height: 500)))
        let shopD = ShopDetail()
        shopD.translatesAutoresizingMaskIntoConstraints = false
        shopD.backgroundColor = .lightGray
        shopD.layer.cornerRadius = 5
        shopD.layer.shadowColor = UIColor.black.cgColor
        shopD.layer.shadowOffset = CGSize(width: 0, height: 2)
        shopD.layer.shadowRadius = 4
        shopD.layer.shadowOpacity = 0.3
        return shopD
    }()
    
    
    
    private lazy var shoppingCart: ShoppingCartController = {
        let cart = ShoppingCartController()
        return cart
    }()
    
    private lazy var mainTableView: MainTableView = {
        let table = MainTableView(frame: CGRect(x: 0, y: 200, width: SCREENWIDTH, height: 600), style: .plain)
//        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .blue
        table.scrollsToTop = false
        return table
    }()
    
    private lazy var shopping: ShoppoingController = {
        let cart = ShoppoingController()
        return cart
    }()
    
    private let cellId = "CellId"
    private var list = [GoodsModel]()
    
    private var scrollView: BackScrollView = {
        let scroll = BackScrollView()
        scroll.scrollsToTop = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
}

