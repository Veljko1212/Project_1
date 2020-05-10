//
//  AudioServices.swift
//  Hangman
//
//  Created by Veljko Milosevic on 10/05/2020.
//  Copyright © 2020 Veljko Milosevic. All rights reserved.
//

import Foundation
import AVFoundation

class AudioService {
    
    enum Sound: String {
        case win = "win"
        case lose = "lose"
        case passed = "passed"
        case hanged = "hanged"
    }
    
    private var soundOn = AppSettings.shared.soundOn
    private var player = AVAudioPlayer()
    
    func playSound(sound:Sound) {
        if soundOn == true {
            let path = Bundle.main.path(forResource: sound.rawValue, ofType : "wav")!
            let url = URL(fileURLWithPath : path)
            
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player.play()
                
            } catch {
                print ("There is an issue with this code!")
            }
        }
        return
        
    }
    
}



