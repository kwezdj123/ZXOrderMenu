//
//  ZXOrderMenu.swift
//  ZXOrderMenu
//
//  Created by apple on 2020/2/26.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ZXOrderMenu: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- FUNC
    /*public*/
    /*private*/
    private func setUpView(){
        
    }
    //MARK:- Getter Setter
    /*public*/
    /*private*/
    private let cellId = "ZXMenuCell"
    private var list = [String]()
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

}
extension ZXOrderMenu: UITableViewDelegate{
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
}
extension ZXOrderMenu: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId) as? UITableViewCell
        cell = cell == nil ? UITableViewCell(style: .default, reuseIdentifier: cellId) : cell
        return cell!
    }
    
}
