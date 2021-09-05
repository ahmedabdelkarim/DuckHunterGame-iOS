//
//  GunType.swift
//  DuckHunter
//
//  Created by Ahmed Abdelkarim on 03/05/2021.
//

import Foundation

enum GunType: String {
    case rightGun = "right_gun"
    case leftGun = "left_gun"
    
    func shoot() {
        switch self {
        case .rightGun:
            AudioPlayer.play(assetName: "right_gun_shoot")
        case .leftGun:
            AudioPlayer.play(assetName: "left_gun_shoot")
        }
    }
}
