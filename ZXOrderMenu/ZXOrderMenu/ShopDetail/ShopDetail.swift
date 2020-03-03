//
//  ShopDetail.swift
//  ZXOrderMenu
//
//  Created by Mr.Zhu on 2020/2/27.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ShopDetail: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        setTitle(title: "肯德基宅急送（北仑银泰店）",
                 AndImage: UIImage(named: "gouwuche"))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(title: String,AndImage image: UIImage?){
        titleLabel.text = title
        imageView.image = image
    }
    
    private func setUpView(){
        
        addSubview(imageView)
        
        NSLayoutConstraint(item: imageView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .top,
                           multiplier: 1,
                           constant: -20).isActive = true
        
        NSLayoutConstraint(item: imageView,
                           attribute: .right,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .right,
                           multiplier: 1,
                           constant: -10).isActive = true
        
        NSLayoutConstraint(item: imageView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 36).isActive = true
        
        NSLayoutConstraint(item: imageView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 36).isActive = true
        
        addSubview(titleLabel)
        NSLayoutConstraint(item: titleLabel,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .top,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: titleLabel,
                           attribute: .left,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .left,
                           multiplier: 1,
                           constant: 15).isActive = true
        
        NSLayoutConstraint(item: titleLabel,
                           attribute: .right,
                           relatedBy: .equal,
                           toItem: imageView,
                           attribute: .left,
                           multiplier: 1,
                           constant: -20).isActive = true
        
        NSLayoutConstraint(item: titleLabel,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 30).isActive = true
        
        addSubview(bottomDetailBack)
        NSLayoutConstraint(item: bottomDetailBack,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .top,
                           multiplier: 1,
                           constant: 100).isActive = true
        
        NSLayoutConstraint(item: bottomDetailBack,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .width,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: bottomDetailBack,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: bottomDetailBack,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: -10).isActive = true
        
        bottomDetailBack.addSubview(toTopButton)
        NSLayoutConstraint(item: toTopButton,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 30).isActive = true
        
        NSLayoutConstraint(item: toTopButton,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: bottomDetailBack,
                           attribute: .width,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: toTopButton,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: bottomDetailBack,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: toTopButton,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: bottomDetailBack,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 0).isActive = true
    }

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var bottomDetailBack: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var toTopButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "to_top"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
}
