//
//  Define.swift
//  ZXOrderMenu
//
//  Created by apple on 2020/2/26.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

let SCREENWIDTH = UIScreen.main.bounds.width
let SCREENHEIGHT = UIScreen.main.bounds.height
let safeAreaBottom: CGFloat = SCREENHEIGHT >= 812 ? 34 : 0

let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
let navBarHeight: CGFloat = 44

var navigationHeight: CGFloat {
    return statusBarHeight + navBarHeight
}
