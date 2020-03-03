//
//  MainTableView.swift
//  ZXOrderMenu
//
//  Created by Mr.Zhu on 2020/2/27.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class MainTableView: UITableView {

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
        rowHeight = 600
    }

}
extension MainTableView:UITableViewDelegate{
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .brown
        return view
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
}

extension MainTableView:UITableViewDataSource{
    //MARK:- UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "id")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "id")
            let leftTable = SubLeftTableView(frame: CGRect(x: 0, y: 0, width: 100, height: 1000), style: .plain)
            let subTable = SubTableView(frame: CGRect(x: 100, y: 0, width: SCREENWIDTH-100, height: 1000), style: .plain)
            cell?.addSubview(leftTable)
            cell?.addSubview(subTable)
        }
        cell?.selectionStyle = .none
        cell?.backgroundColor = .white
        
        return cell!
    }
    
}

extension MainTableView: UIGestureRecognizerDelegate{
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
}

class BackScrollView: UIScrollView {
    
}

extension BackScrollView: UIGestureRecognizerDelegate{
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}

