//
//  Extension.swift
//  Scrumdinger
//
//  Created by Abdalrahim Al Ayubi  on 26/12/2020.
//

import Foundation
import AVFoundation

extension AVPlayer {
    static let sharedDingPlayer: AVPlayer = {
        guard let url = Bundle.main.url(forResource: "ding", withExtension: "wav") else { fatalError("Failed to find sound file.") }
        return AVPlayer(url: url)
    }()
}
