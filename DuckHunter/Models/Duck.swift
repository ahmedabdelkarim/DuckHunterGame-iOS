//
//  Duck.swift
//  DuckHunter
//
//  Created by Ahmed Abdelkarim on 03/05/2021.
//

import Foundation
import CoreGraphics

struct Duck {
    var type: DuckType
    var position: CGPoint
    var size: CGFloat
    
    func quack() {
        self.type.quack()
    }
    
    func quackHunted() {
        self.type.quackHunted()
    }
}
