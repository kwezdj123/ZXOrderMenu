//
//  ShoppingBarMiddleView.swift
//  ZXOrderMenu
//
//  Created by apple on 2020/2/26.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ShoppingBarMiddleView: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        blurView.frame = bounds
        blurView.alpha = 0.8
    }
    
    let blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        return UIVisualEffectView(effect: blurEffect)
    }()
    
    convenience init() {
        self.init(frame:.zero)
        setUpView()
    }
    
    //MARK:- FUNC
    /*public*/
    /*private*/
    private func setUpView(){
//        backgroundColor = .black
        addGestureRecognizer(tap)
        addSubview(blurView)
    }
    
    @objc private func tapBack(_ tap: UITapGestureRecognizer){
        guard tap.view != nil else{
            return
        }
        tapClouser?(tap)
    }
    
    //MARK:- Getter Setter
    /*public*/
    public var tapClouser: ((UITapGestureRecognizer)->Void)?
    /*private*/
    lazy var tap = UITapGestureRecognizer(target: self, action: #selector(tapBack))
    
    deinit {
        removeGestureRecognizer(tap)
    }

}
