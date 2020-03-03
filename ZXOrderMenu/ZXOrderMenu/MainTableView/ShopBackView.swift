//
//  ShopBackView.swift
//  ZXOrderMenu
//
//  Created by Mr.Zhu on 2020/2/28.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ShopBackView: UIScrollView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint(item: mainTable,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: bounds.size.width-80).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setList(_ list: [LeftTitleModel:[GoodsModel]]){
        
        leftList = list.map({ $0.key })
        
        subTable.setData(leftList)
        mainTable.setData(list)
        
    }
    
    private var leftList = [LeftTitleModel]()
    
    private func setUpView(){
        
        addSubview(mainTable)
        addSubview(subTable)
        
        NSLayoutConstraint(item: subTable,
                           attribute: .left,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .left,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: subTable,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .top,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: subTable,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .height,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: subTable,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 80).isActive = true
        
        
        
        NSLayoutConstraint(item: mainTable,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .top,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: mainTable,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .height,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: mainTable,
                           attribute: .left,
                           relatedBy: .equal,
                           toItem: subTable,
                           attribute: .right,
                           multiplier: 1,
                           constant: 0).isActive = true
    }
    
    private lazy var mainTable: SubTableView = {
        
        let main = SubTableView(frame: CGRect(x: 0, y: navigationHeight, width: SCREENWIDTH, height: SCREENHEIGHT-navigationHeight), style:.plain)
        main.translatesAutoresizingMaskIntoConstraints = false
        main.myDelegate = self
        return main
    }()
    
    private lazy var subTable: SubLeftTableView = {
        let sub = SubLeftTableView(frame: CGRect(x: 0, y: navigationHeight, width: SCREENWIDTH, height: SCREENHEIGHT-navigationHeight), style:.plain)
        sub.translatesAutoresizingMaskIntoConstraints = false
        sub.myDelegate = self
        return sub
    }()
}

extension ShopBackView: SubLeftTableViewDelegate{
    func selectedRow(_ row: Int) {
        mainTable.selectedRow(row)
    }
}

extension ShopBackView: SubTableViewDelegate{
    func scrollToRow(_ row: Int) {
        subTable.selectRow(row: row)
    }
}

extension ShopBackView: UIGestureRecognizerDelegate{
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
