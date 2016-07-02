//
//  HttpResult.swift
//  App
//
//  Created by Sai on 16/6/28.
//  Copyright © 2016年 soyoung. All rights reserved.
//

import Foundation
import SwiftyJSON

class HttpResult {
    var status: Int?
    var content: JSON?
    var msg: String?
    
    required init?(json: JSON){
        status = json["status"].int
        msg = json["msg"].string
        content = json["content"]
    }
    
}