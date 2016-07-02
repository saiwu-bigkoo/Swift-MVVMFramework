//
//  HttpServiceGenerator.swift
//  App
//
//  Created by Sai on 16/6/28.
//  Copyright © 2016年 soyoung. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class HttpServiceGenerator {
    
    class func request(method: Alamofire.Method = .POST, url: URLStringConvertible,encoding: ParameterEncoding = .URL, parameters: [String: AnyObject]? = nil, headers: [String: String]? = nil, callback: HttpServiceCallBackProtocol){
        
        Alamofire.Manager.sharedInstance.request(method, url, parameters: parameters,encoding: encoding,headers: headers).responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    
                    guard let result = HttpResult(json: json) else{
                        //服务器返回的json格式有问题
                        callback.onHttpFail(response.response?.statusCode, msg: "")
                        break
                    }
                    if result.status == HttpStatusConstants.RESULT_OK {
                        //正确返回约定的OK码
                        callback.onHttpSuccess(result.content, msg: result.msg)
                    }
                    else {
                        //返回约定的其他类型码，可根据返回码进行相对应的操作
                        callback.onHttpFail(response.response?.statusCode, msg: result.msg)
                    }
                }
                break
            case .Failure:
                callback.onNetWorkError()
            }
            callback.onHttpComplete()
        }
    }

}
