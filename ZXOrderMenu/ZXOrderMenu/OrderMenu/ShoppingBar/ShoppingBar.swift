//
//  ShoppingBar.swift
//  ZXOrderMenu
//
//  Created by apple on 2020/2/26.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ShoppingBar: UIView {
    convenience init() {
        self.init(frame:.zero)
        setUpView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.size.height/2
        
        let maskLayer = CAShapeLayer()
        let path = UIBezierPath(roundedRect: connectButton.bounds, byRoundingCorners: [.topLeft,.bottomLeft],
                                cornerRadii: CGSize(width: bounds.size.height/2, height: bounds.size.height/2))

        maskLayer.path = path.cgPath
        connectButton.layer.mask = maskLayer
        
        let rightMaskLayer = CAShapeLayer()
        let rightPath = UIBezierPath(roundedRect: makeOrderButton.bounds, byRoundingCorners: [.topRight,.bottomRight],
                                cornerRadii: CGSize(width: bounds.size.height/2, height: bounds.size.height/2))

        rightMaskLayer.path = rightPath.cgPath
        makeOrderButton.layer.mask = rightMaskLayer
        
    }

    //MARK:- FUNC
    /*public*/
    /*private*/
    private func setUpView(){
        
        backgroundColor = .clear
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.5
        
        addSubview(connectButton)
        NSLayoutConstraint(item: connectButton,
                           attribute: .left,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .left,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: connectButton,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .top,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: connectButton,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: connectButton,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 80).isActive = true
        
        addSubview(middleView)
        NSLayoutConstraint(item: middleView,
                           attribute: .left,
                           relatedBy: .equal,
                           toItem: connectButton,
                           attribute: .right,
                           multiplier: 1,
                           constant: 2).isActive = true
        
        NSLayoutConstraint(item: middleView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .top,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: middleView,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: middleView,
                           attribute: .right,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .right,
                           multiplier: 1,
                           constant: -80).isActive = true
        
        addSubview(makeOrderButton)
        NSLayoutConstraint(item: makeOrderButton,
                           attribute: .left,
                           relatedBy: .equal,
                           toItem: middleView,
                           attribute: .right,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: makeOrderButton,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .top,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: makeOrderButton,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: makeOrderButton,
                           attribute: .right,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .right,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        
        addSubview(imageView)
        NSLayoutConstraint(item: imageView,
                           attribute: .left,
                           relatedBy: .equal,
                           toItem: middleView,
                           attribute: .right,
                           multiplier: 1,
                           constant: 5).isActive = true
        
        NSLayoutConstraint(item: imageView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .top,
                           multiplier: 1,
                           constant: -10).isActive = true
        
        NSLayoutConstraint(item: imageView,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 2).isActive = true
        
        NSLayoutConstraint(item: imageView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 30).isActive = true
    }
    
    //MARK:- Getter Setter
    /*public*/
    public var tapClouser: ((UITapGestureRecognizer)->Void)?{
        didSet{
            middleView.tapClouser = tapClouser
        }
    }
    
    /*private*/
    private var connectButton: UIButton = {
        let button = UIButton()
        button.setTitle("联系商家", for: .normal)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        return button
    }()
    
    private var makeOrderButton: UIButton = {
        let button = UIButton()
        button.setTitle("去结算", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .orange
        return button
    }()
    
    private lazy var middleView: ShoppingBarMiddleView = {
        let middle = ShoppingBarMiddleView()
        middle.translatesAutoresizingMaskIntoConstraints = false
        return middle
    }()
    
    private lazy var imageView: UIImageView = {
        let imv = UIImageView()
        return imv
    }()
}
