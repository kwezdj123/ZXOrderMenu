//
//  SubTableCell.swift
//  ZXOrderMenu
//
//  Created by Mr.Zhu on 2020/2/28.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class SubTableCell: UITableViewCell {

    private let margin_top: CGFloat = 10
    private let margin_left: CGFloat = 10
    private let margin_right: CGFloat = -10
    private let margin_bottom: CGFloat = -10
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(_ title: String,monthSale: Int,currentPrice: Double,originPrice: Double,goodsImage: UIImage?){
        goodsImageView.image = goodsImage
        titleLabel.text = title
        monthSaleLabel.text = "月销:\(monthSale)"
        priceLabel.text = "¥\(currentPrice) \(originPrice)"
    }
    
    private func setUpView(){
        
        contentView.addSubview(goodsImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(monthSaleLabel)
        contentView.addSubview(priceLabel)
        addLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        image_widthConstraint.constant = bounds.size.height-margin_top*2
    }
    
    private func addLayout(){
        
        NSLayoutConstraint(item: goodsImageView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: contentView,
                           attribute: .top,
                           multiplier: 1,
                           constant: margin_top).isActive = true
        
        NSLayoutConstraint(item: goodsImageView,
                           attribute: .left,
                           relatedBy: .equal,
                           toItem: contentView,
                           attribute: .left,
                           multiplier: 1,
                           constant: margin_left).isActive = true
        
        NSLayoutConstraint(item: goodsImageView,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: contentView,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: margin_bottom).isActive = true
        
        image_widthConstraint = NSLayoutConstraint(item: goodsImageView,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1,
                                                   constant: 0)
        image_widthConstraint.isActive = true
        
        NSLayoutConstraint(item: titleLabel,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: contentView,
                           attribute: .top,
                           multiplier: 1,
                           constant: margin_top).isActive = true
        
        NSLayoutConstraint(item: titleLabel,
                           attribute: .left,
                           relatedBy: .equal,
                           toItem: goodsImageView,
                           attribute: .right,
                           multiplier: 1,
                           constant: 10).isActive = true
        
        NSLayoutConstraint(item: titleLabel,
                           attribute: .right,
                           relatedBy: .equal,
                           toItem: contentView,
                           attribute: .right,
                           multiplier: 1,
                           constant: margin_right).isActive = true

        NSLayoutConstraint(item: titleLabel,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 40).isActive = true

        NSLayoutConstraint(item: monthSaleLabel,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: titleLabel,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 10).isActive = true

        NSLayoutConstraint(item: monthSaleLabel,
                           attribute: .left,
                           relatedBy: .equal,
                           toItem: goodsImageView,
                           attribute: .right,
                           multiplier: 1,
                           constant: 10).isActive = true

        NSLayoutConstraint(item: monthSaleLabel,
                           attribute: .right,
                           relatedBy: .equal,
                           toItem: contentView,
                           attribute: .right,
                           multiplier: 1,
                           constant: margin_right).isActive = true

        NSLayoutConstraint(item: monthSaleLabel,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 14).isActive = true

        NSLayoutConstraint(item: priceLabel,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: contentView,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: margin_bottom).isActive = true

        NSLayoutConstraint(item: priceLabel,
                           attribute: .left,
                           relatedBy: .equal,
                           toItem: goodsImageView,
                           attribute: .right,
                           multiplier: 1,
                           constant: 10).isActive = true

        NSLayoutConstraint(item: priceLabel,
                           attribute: .right,
                           relatedBy: .equal,
                           toItem: contentView,
                           attribute: .right,
                           multiplier: 1,
                           constant: margin_right).isActive = true

        NSLayoutConstraint(item: priceLabel,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 18).isActive = true
    }
    
    private var image_widthConstraint = NSLayoutConstraint()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var monthSaleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.init(red: 120/255.0, green: 120/255.0, blue: 120/255.0, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var goodsImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .blue
        image.layer.cornerRadius = 5
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
}
