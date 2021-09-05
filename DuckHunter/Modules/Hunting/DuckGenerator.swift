//
//  DuckGenerator.swift
//  DuckHunter
//
//  Created by Ahmed Abdelkarim on 03/05/2021.
//

import Foundation
import CoreGraphics
import UIKit

class DuckGenerator {
    let minSize: CGFloat
    let maxSize: CGFloat
    
    init(minSize: CGFloat, maxSize: CGFloat) {
        self.minSize = minSize
        self.maxSize = maxSize
    }
    
    func generate(ofType duckType: DuckType) -> Duck {
        //set random size & position
        let randomSize = CGFloat.random(in: minSize...maxSize)
        
        let screenWidth  = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let insets = UIApplication.shared.keyWindow?.safeAreaInsets
        let topInset = insets?.top ?? 0
        let bottomInset = insets?.bottom ?? 0
        
        let randomPosition = CGPoint(x: CGFloat.random(in: 0...screenWidth - randomSize), y: CGFloat.random(in: 0 + topInset...screenHeight - randomSize - bottomInset))
        
        return Duck(type: duckType, position: randomPosition, size: randomSize)
    }
}
