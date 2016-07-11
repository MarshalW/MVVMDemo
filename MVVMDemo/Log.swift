//
//  Log.swift
//  MVVCDemo
//
//  Created by Marshal Wu on 16/7/11.
//  Copyright © 2016年 Marshal Wu. All rights reserved.
//

import Foundation

// 只在DEBUG情况下打印处理日志，RELEASE情况下不打印
// 需要配置Swift Compiler - Custom Flags -Other Swift Flags - Debug >  -D DEBUG
func print(@autoclosure item: () -> Any,file: String = #file,
                        method: String = #function,
                        line: Int = #line) {
    #if DEBUG
        Swift.print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(item())")
    #endif
}