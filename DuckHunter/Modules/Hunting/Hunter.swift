//
//  Hunter.swift
//  DuckHunter
//
//  Created by Ahmed Abdelkarim on 03/05/2021.
//

import Foundation
import CoreGraphics

class Hunter {
    func hunt(duck: Duck, targetPoint: CGPoint) -> Bool {
        //check if targetPoint is on duck image
        if targetPoint.x >= duck.position.x && targetPoint.x <= duck.position.x + duck.size
            && targetPoint.y >= duck.position.y && targetPoint.y <= duck.position.y + duck.size {
            duck.quackHunted()
            
            return true
        }
        else {
            return false
        }
    }
}
