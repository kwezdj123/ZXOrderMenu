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
        view.backgroundColor = .white
        addChild(shoppingCart)
        view.addSubview(shoppingCart.view)
    }
    
    private lazy var shoppingCart: ShoppingCartController = {
        let cart = ShoppingCartController()
        return cart
    }()
    
    private lazy var shopping: ShoppoingController = {
        let cart = ShoppoingController()
        return cart
    }()
    private let cellId = "CellId"
    private var list = [String]()
    
}

