//
//  Song.swift
//  MVVCDemo
//
//  Created by Marshal Wu on 16/7/7.
//  Copyright © 2016年 Marshal Wu. All rights reserved.
//

import Foundation

class Song{
    var name:String
    var singer:String
    var image:String
    var songUrl:String
    
    init(name:String,singer:String,image:String,songUrl:String){
        self.name=name
        self.singer=singer
        self.image=image
        self.songUrl=songUrl
    }
}
