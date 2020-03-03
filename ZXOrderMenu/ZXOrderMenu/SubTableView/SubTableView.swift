//
//  SubTableView.swift
//  ZXOrderMenu
//
//  Created by Mr.Zhu on 2020/2/27.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

@objc protocol SubTableViewDelegate {
    @objc optional func scrollToRow(_ row: Int)
}

class SubTableView: UITableView {

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
        backgroundColor = .red
        rowHeight = 120
        separatorColor = .clear
    }

    func setData(_ data: [LeftTitleModel:[GoodsModel]]){
        titles = data.map({ $0.key })
        titles.sort(by: { $0.sort < $1.sort })
        contents = data.map({ $0.value })
        reloadData()
    }
    private var contents = [[GoodsModel]]()
    private var titles = [LeftTitleModel]()
    private var currentIndex = 0
    weak var myDelegate: SubTableViewDelegate?
    private var isUserMove = true
}

extension SubTableView: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? SubTableCell else { return }
        let data = contents[indexPath.section][indexPath.row]
        cell.setTitle("\(data.name)",
                      monthSale: data.monthSale,
                      currentPrice: data.currentpPrice,
                      originPrice: data.originPrice,
                      goodsImage: data.image)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let label = UILabel()
        label.frame = CGRect(origin: CGPoint(x: 15, y: 0),
                             size: CGSize(width: SCREENWIDTH-30, height: 30))
        label.textColor = .black
        label.textAlignment = .left
        view.addSubview(label)
        
        let title = titles[section].name
        label.text = title
        view.backgroundColor = .red
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    public func selectedRow(_ row: Int){
        isUserMove = false
        let indexpath = IndexPath(row: 0, section: row)
        scrollToRow(at: indexpath, at: .top, animated: true)
        
    }
    
}

extension SubTableView:UITableViewDataSource{
    //MARK:- UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return titles.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "id") as? SubTableCell
        cell == nil ? cell = SubTableCell(style: .value1, reuseIdentifier: "id") : ()
        cell?.selectionStyle = .none
        cell?.backgroundColor = .white
        return cell!
    }
    
}

extension SubTableView{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        setLeftIndexPath(contentOffset: scrollView.contentOffset)
        
    }
    
    func setLeftIndexPath(contentOffset: CGPoint){
        var Y: CGFloat = 0
        Y = contentOffset.y == 0 ? 0 : (contentOffset.y + 30)
        let currentOffset = CGPoint(x: contentOffset.x,y: Y)
        
        if let indexPath = indexPathForRow(at: currentOffset){
            if indexPath.section != currentIndex && isUserMove{
                currentIndex = indexPath.section
                print("currentIndex:\(currentIndex)")
                myDelegate?.scrollToRow?(currentIndex)
            }
        }
    }
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        isUserMove = true
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
    }
}





