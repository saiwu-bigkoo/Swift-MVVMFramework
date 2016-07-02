//
//  HttpServiceCallBack.swift
//  App
//
//  Created by Sai on 16/6/28.
//  Copyright © 2016年 soyoung. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol HttpServiceCallBackProtocol {
    func onHttpSuccess(resultData: JSON?, msg: String?) ->Void
    func onHttpFail(code: Int?, msg: String?) ->Void
    func onNetWorkError() ->Void
    func onHttpComplete() ->Void
}

//struct HttpServiceCallBackProtocolThunk<T> : HttpServiceCallBackProtocol {
//    // closure which will be used to implement `magic()` as declared in the protocol
//    private let _onHttpSuccess : (resultData: T?, msg: String?) ->Void
//    private let _onHttpFail : (code: Int?, msg: String?) ->Void
//    private let _onNetWorkError : () ->Void
//    private let _onHttpComplete : () ->Void
//    
//    // `T` is effectively a handle for `AbstractType` in the protocol
//    init<P : HttpServiceCallBackProtocol where P.T == T>(_ dep : P) {
//        // requires Swift 2, otherwise create explicit closure
//        _onHttpSuccess = dep.onHttpSuccess
//        _onHttpFail = dep.onHttpFail
//        _onNetWorkError = dep.onNetWorkError
//        _onHttpComplete = dep.onHttpComplete
//    }
//    
//    func onHttpSuccess(resultData: T?, msg: String?) ->Void{
//        return _onHttpSuccess(resultData: resultData, msg: msg)
//    }
//    func onHttpFail(code: Int?, msg: String?) ->Void{
//        return _onHttpFail(code: code, msg: msg)
//    }
//    func onNetWorkError() ->Void{
//        return _onNetWorkError()
//    }
//    func onHttpComplete() ->Void{
//        return _onHttpComplete()
//    }
//}