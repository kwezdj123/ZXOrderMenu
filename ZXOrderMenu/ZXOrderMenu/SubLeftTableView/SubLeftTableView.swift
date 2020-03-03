//
//  SubLeftTableView.swift
//  ZXOrderMenu
//
//  Created by Mr.Zhu on 2020/2/27.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
@objc protocol SubLeftTableViewDelegate {
    func selectedRow(_ row: Int)
}
class SubLeftTableView: UITableView {

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView(){
        delegate = self
        dataSource = self
        backgroundColor = .orange
        rowHeight = 50
    }
    
    weak var myDelegate: SubLeftTableViewDelegate?
    private var currentSelectRow = 0
    func selectRow(row: Int){
        currentSelectRow = row
        let index = IndexPath(row: row, section: 0)
        let cell = cellForRow(at: index)
        scrollToRow(at: index, at: .middle, animated: true)
        setCellColor(cell: cell)
    }
    
    func setCellColor(cell: UITableViewCell?){
        visibleCells.forEach({
            $0.backgroundColor = .white
        })
        cell?.backgroundColor = .red
    }
    
    func setData(_ data: [LeftTitleModel]){
        titles = data
        titles.sort(by: { $0.sort < $1.sort })
        reloadData()
        DispatchQueue.main.async {
            self.selectRow(row: 0)
        }
    }
    
    private var titles = [LeftTitleModel]()
}

extension SubLeftTableView:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectRow(row: indexPath.row)
        myDelegate?.selectedRow(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.textLabel?.text = titles[indexPath.row].name
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        
    }
}

extension SubLeftTableView:UITableViewDataSource{
    //MARK:- UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "id")
        cell == nil ? cell = UITableViewCell(style: .value1, reuseIdentifier: "id") : ()
        cell?.selectionStyle = .none
        cell?.backgroundColor = .white
        return cell!
    }
    
}
