//
//  BaseListViewModel.swift
//  MVVMFramework
//
//  Created by Sai on 16/6/27.
//  Copyright © 2016年 soyoung. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

/// 列表请求基类ViewModel
class BaseListViewModel<T: BaseModel>: BaseViewModel, HttpServiceCallBackProtocol{
    let firstPage: Int = 1
    /**页码，默认是 1 */
    var page: Int = 1
    /**每页的条数*/
    var pageSize: Int = 10
    /**刷新状态回调*/
    var onRefresh: ((Bool) -> Void)?
    /**刷新状态*/
    private(set) var refreshing: Bool = false {
        didSet { self.onRefresh?(refreshing) }
    }
    
    var hasMore: Bool = false
    var loadingMore: Bool = false
    /**控制loading状态只有一次,对于列表的loading概念，就是首次加载数据，其余加载分别是刷新和更多*/
    var once:Bool = false
    var items: Array<T> = Array()
    
    /**
     * 刷新数据
     */
    func onListRefresh() {
        refreshing = true
        //把分页配置还原成加载第一页状态
        page = firstPage
        hasMore = false
        loadingMore = false
        if !once {
            statusLoading = true
        }
        //网络请求
        onLoadListHttpRequest()
    }
    /**
     * 加载数据
     */
    func onListLoadMore() {
        //判断是否已经在进行加载更多 或 没有更多了，是则直接返回等待加载完成。
        if loadingMore || !hasMore {
            return
        }
        //刷新中也直接返回不加载更多
        if refreshing{
            return
        }
        //分页增加
        page += 1;
        loadingMore = true
        
        //网络请求
        onLoadListHttpRequest()
    }
    
    func isFirstPage() -> Bool{
        return page == firstPage;
    }

    /**
     * 网络请求
     */
    func onLoadListHttpRequest(){
        HttpServiceGenerator.request(url: getLoadListUrl(),parameters: getHttpParams(), callback: self)
    }
    
    func onHttpSuccess(resultData: JSON?, msg: String?) ->Void{
        statusError = false
        statusNetworkError = false
        
        if(isFirstPage()) {
            items.removeAll();
        }
        if(resultData != nil) {
            for json in resultData!.arrayValue{
                items.append(T(json: json)!)
            }
            //如果获取的数据数量比申请的数量少 则为没有更多了
            hasMore = resultData?.arrayValue.count < pageSize ? false : true
        }
    }
    
    func onHttpFail(code: Int?, msg: String?) ->Void{
        statusError = true
    }
    
    func onNetWorkError() ->Void{
        statusNetworkError = true
    }
    
    func onHttpComplete() ->Void{
        once = true;
        statusLoading = false
        if !statusError && !statusNetworkError {
            statusEmpty = items.isEmpty
        }
        
        //因为在刷新之前已经把page设为了firstPage，所以可以判断isFirstPage()来判断当前是否刷新
        if(isFirstPage()){
            refreshing = false
        }
        else{
            loadingMore = false
        }
        
        onLoadListComplete();
    }
    
    /**
     列表加载完成调用，可用于子类重写判断是否需要增加或删除footer
     */
    func onLoadListComplete() {
        
    }
    
    /**
     提供参数给HTTP请求
     
     - returns: 参数集合
     */
    func getHttpParams() -> [String: AnyObject] {
        return [:]
    }
    
    /**
     列表的HTTP请求的URL
     
     - returns: url地址
     */
    func getLoadListUrl() -> String{
        return ""
    }
    
    
}
