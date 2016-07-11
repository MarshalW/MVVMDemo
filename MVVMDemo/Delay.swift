//
//  Functions.swift
//  MVVCDemo
//
//  Created by Marshal Wu on 16/7/9.
//  Copyright © 2016年 Marshal Wu. All rights reserved.
//

import Foundation


// 延时处理，使用方式如下：
//delay(1.0){
//    print("hello")
//}
func delay(delay: Double, closure: () -> ()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}