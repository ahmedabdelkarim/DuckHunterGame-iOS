//
//  AudioPlayer.swift
//  DuckHunter
//
//  Created by Ahmed Abdelkarim on 03/05/2021.
//

import Foundation
import AVFoundation
import UIKit

/// Audio player that supports playing multiple audio tracks in parallel at the same time.
class AudioPlayer: NSObject, AVAudioPlayerDelegate {
    //MARK: - Properties
    private static let shared = AudioPlayer()
    private static var audioPlayers = [AVAudioPlayer]()
    
    //MARK: - Methods
    static func play(assetName: String) {
        guard let audioData = NSDataAsset(name: assetName)?.data else {
            return
        }
        
        do {
            let audioPlayer = try AVAudioPlayer(data: audioData)
            audioPlayer.delegate = shared
            audioPlayers.append(audioPlayer)
            audioPlayer.play()
        }
        catch {
            // couldn't load file :(
        }
    }
    
    //MARK: - AVAudioPlayerDelegate
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if let index = AudioPlayer.audioPlayers.firstIndex(of: player) {
            AudioPlayer.audioPlayers.remove(at: index)
        }
    }
}
