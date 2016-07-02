//
//  BaseViewModel.swift
//  MVVMFramework
//
//  Created by Sai on 16/6/14.
//  Copyright © 2016年 soyoung. All rights reserved.
//

import Foundation
class BaseViewModel: NSObject{
    var onStatusChange: ((BaseViewModel) -> Void)?
    
    var statusEmpty: Bool = false{
        didSet{
            if oldValue != statusEmpty{
                self.onStatusChange?(self)
            }
        }
    }
    
    var statusLoading: Bool = false{
        didSet{
            if oldValue != statusLoading{
                self.onStatusChange?(self)
            }
        }
    }

    var statusError: Bool = false{
        didSet{
            if oldValue != statusError{
                self.onStatusChange?(self)
            }
        }
    }

    var statusNetworkError: Bool = false{
        didSet{
            if oldValue != statusNetworkError{
                self.onStatusChange?(self)
            }
        }
    }

    
    

    
    var onViewModelNotifyDelegate: OnViewModelNotifyDelegate?
}
