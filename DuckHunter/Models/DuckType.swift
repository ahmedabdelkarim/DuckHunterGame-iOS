//
//  DuckType.swift
//  DuckHunter
//
//  Created by Ahmed Abdelkarim on 03/05/2021.
//

import Foundation

enum DuckType: String {
    case happyDuck = "happy_duck"
    case sadDuck = "sad_duck"
    
    func quack() {
        switch self {
        case .happyDuck:
            AudioPlayer.play(assetName: "happy_duck_quack")
        case .sadDuck:
            AudioPlayer.play(assetName: "sad_duck_quack")
        }
    }
    
    func quackHunted() {
        switch self {
        case .happyDuck:
            AudioPlayer.play(assetName: "happy_duck_hunted_quack")
        case .sadDuck:
            AudioPlayer.play(assetName: "sad_duck_hunted_quack")
        }
    }
}
