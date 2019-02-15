//
//  Player.swift
//  Frog Songs
//
//  Created by Chris Nielubowicz on 2/15/19.
//  Copyright © 2019 nielubowicz. All rights reserved.
//

import Foundation
import AVKit

class Player: NSObject, AVAudioPlayerDelegate {
    static let shared = Player()
    
    fileprivate var player: AVAudioPlayer?
    override private init() {
        
    }
    
    func play(_ url: URL) throws {
        player = try AVAudioPlayer(contentsOf: url)
        player?.delegate = self
        player?.play()
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        print(error)
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        
    }
}
