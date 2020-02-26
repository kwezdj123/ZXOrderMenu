//
//  ShoppingCartController.swift
//  ZXOrderMenu
//
//  Created by apple on 2020/2/26.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ShoppingCartController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.isUserInteractionEnabled = true
        view.addSubview(listView)
        view.addSubview(shoppingBar)
        addLayout()
        addListLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        modalPresentationStyle = .overCurrentContext
        modalTransitionStyle = .crossDissolve
        navigationController?.modalPresentationStyle = .currentContext
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        dismiss()
    }
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    private var isShow = false
    
    public func show(){
        isShow = true
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear, animations: {
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
            self.listTopConstranint.constant = -350
            self.view.layoutIfNeeded()
        }) { (finished) in
            
        }
    }
    
    public func dismiss(){
        isShow = false
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear, animations: {
            self.view.backgroundColor = .clear
            self.listTopConstranint.constant = 0
            self.view.layoutIfNeeded()
        }) { (finished) in
            
        }
    }
    
    private lazy var shoppingBar: ShoppingBar = {
        let bar = ShoppingBar()
        bar.tapClouser = tapClouser(_:)
        bar.translatesAutoresizingMaskIntoConstraints = false
        return bar
    }()
    
    private func tapClouser(_ tap: UITapGestureRecognizer){
        isShow ? dismiss() : show()
    }
    
    private var listTopConstranint = NSLayoutConstraint()
    private func addListLayout(){
        listView.backgroundColor = .blue
        listView.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            listTopConstranint = NSLayoutConstraint(item: listView,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: view.safeAreaLayoutGuide,
                               attribute: .bottom,
                               multiplier: 1,
                               constant: 0)
            listTopConstranint.isActive = true
        } else {
            listTopConstranint = NSLayoutConstraint(item: listView,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: view,
                               attribute: .bottom,
                               multiplier: 1,
                               constant: safeAreaBottom)
            listTopConstranint.isActive = true
        }
        
        NSLayoutConstraint(item: listView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: listView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .width,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: listView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 350).isActive = true
    }
    
    private func addLayout(){
        if #available(iOS 11.0, *) {
            NSLayoutConstraint(item: shoppingBar,
                               attribute: .bottom,
                               relatedBy: .equal,
                               toItem: view.safeAreaLayoutGuide,
                               attribute: .bottom,
                               multiplier: 1,
                               constant: -10).isActive = true
        } else {
            NSLayoutConstraint(item: shoppingBar,
                               attribute: .bottom,
                               relatedBy: .equal,
                               toItem: view,
                               attribute: .bottom,
                               multiplier: 1,
                               constant: -(10+safeAreaBottom)).isActive = true
        }
        
        NSLayoutConstraint(item: shoppingBar,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: shoppingBar,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .width,
                           multiplier: 1,
                           constant: -30).isActive = true
        
        NSLayoutConstraint(item: shoppingBar,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 50).isActive = true
        
    }
    
    private var listView = UIView()
}
