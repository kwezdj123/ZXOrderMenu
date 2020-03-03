//
//  NavigationView.swift
//  ZXOrderMenu
//
//  Created by Mr.Zhu on 2020/2/27.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class NavigationView: UIView {
    
    convenience init() {
        self.init(frame: .zero)
        setUpView()
    }
    private var normalBack: UIView = {
        let view = UIView()
        return view
    }()
    private var whiteBack: UIView = {
        let view = UIView()
        view.alpha = 0
        view.backgroundColor = .white
        return view
    }()
    
    private func setUpNormalView(){
        normalBack.addSubview(backButton)
        addRightButtons()
        
        NSLayoutConstraint(item: backButton,
                           attribute: .left,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .left,
                           multiplier: 1,
                           constant: 10).isActive = true
        
        NSLayoutConstraint(item: backButton,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .top,
                           multiplier: 1,
                           constant: statusBarHeight).isActive = true
        
        NSLayoutConstraint(item: backButton,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 26).isActive = true
        
        NSLayoutConstraint(item: backButton,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 26).isActive = true
    }
    
    private func setUpView(){
        addSubview(normalBack)
        addSubview(whiteBack)
        setUpNormalView()
        
    }
    
    func addRightButtons(){
        let imglist = ["search","gouwuche","collect","more"]
        var list = [UIButton]()
        for index in 0...3{
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setImage(UIImage(named: imglist[index]), for: .normal)
            addSubview(button)
            NSLayoutConstraint(item: button,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .notAnAttribute,
                               multiplier: 1,
                               constant: 20).isActive = true
            
            NSLayoutConstraint(item: button,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .notAnAttribute,
                               multiplier: 1,
                               constant: 20).isActive = true
            
            NSLayoutConstraint(item: button,
                               attribute: .centerY,
                               relatedBy: .equal,
                               toItem: backButton,
                               attribute: .centerY,
                               multiplier: 1,
                               constant: 0).isActive = true
            
            list.append(button)
        }
        
        NSLayoutConstraint(item: list[3],
                           attribute: .right,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .right,
                           multiplier: 1,
                           constant: -15).isActive = true
        
        NSLayoutConstraint(item: list[2],
                           attribute: .right,
                           relatedBy: .equal,
                           toItem: list[3],
                           attribute: .left,
                           multiplier: 1,
                           constant: -20).isActive = true
        
        NSLayoutConstraint(item: list[1],
                           attribute: .right,
                           relatedBy: .equal,
                           toItem: list[2],
                           attribute: .left,
                           multiplier: 1,
                           constant: -20).isActive = true
        
        NSLayoutConstraint(item: list[0],
                           attribute: .right,
                           relatedBy: .equal,
                           toItem: list[1],
                           attribute: .left,
                           multiplier: 1,
                           constant: -20).isActive = true
    }
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named:"back"), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        return button
    }()
}
