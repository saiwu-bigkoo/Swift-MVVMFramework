//
//  BaseTableViewModel.swift
//  App
//
//  Created by Sai on 16/6/29.
//  Copyright © 2016年 soyoung. All rights reserved.
//

import Foundation
import UIKit


class BaseTableViewModel<T: BaseModel>: BaseListViewModel<T>, UITableViewDelegate, UITableViewDataSource{
    typealias TableViewCellRenderBlock = (item: T, indexPath:NSIndexPath,tablleView:UITableView) -> UITableViewCell!
    typealias TableViewCellSelectBlock = (indexPath:NSIndexPath,tablleView:UITableView) -> Void

    var cellRender:TableViewCellRenderBlock! // 创建cell的block
    var cellSlect:TableViewCellSelectBlock? // 选中cell的block
    var cellHeight:CGFloat = UITableViewAutomaticDimension // cell高
    var estimatedHeight:CGFloat = 50// 预估高度
    var sectionsCount:Int = 1// 分组数
    
    /** 分组数 */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sectionsCount
    }
    /** 行数 */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
//    /** 行高 */
//    @objc func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return cellHeight
//    }
    /** cell */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = cellRender(item: items[indexPath.row], indexPath: indexPath,tablleView: tableView)
        return cell
    }
    /** 预估高度 */
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return estimatedHeight
    }
    /** 点击事件 */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        guard let selectBlock = cellSlect else{
            return
        }
        selectBlock(indexPath:indexPath,tablleView:tableView)
    }
    //滚动列表
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if(indexPath.row == items.count - 1){//最后一行加载更多
            onListLoadMore();
        }
    }

}
