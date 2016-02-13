//
//  SoundController.swift
//  Starship Ambiance
//
//  Created by Jeremy Schmidt on 11/23/14.
//  Copyright (c) 2014 Jeremy Schmidt. All rights reserved.
//

import Foundation
import AVFoundation

class SoundController
{
    // Again, probably an improper use of optionals. I should really figure these out
    var player: AVAudioPlayer? = nil
    let session: AVAudioSession = AVAudioSession.sharedInstance()
    func startPlayingSound(selection: String)
    {
        let soundURL: NSURL? = findFileNameOfSound(selection)
        
        if soundURL == nil
        {
            print("Oh no. ")
        }
        else
        {
            print(soundURL)
        }
        
        // Some error handling and stuff (copypasta)
        var error: NSError?
        do {
            try session.setCategory(AVAudioSessionCategoryPlayback)
        } catch let error1 as NSError {
            error = error1
        }
        do {
            self.player = try AVAudioPlayer(contentsOfURL: (soundURL)!)
        } catch let error1 as NSError {
            error = error1
            self.player = nil
        }
        if player == nil
        {
            if let e = error
            {
                print(e.localizedDescription)
            }
        }
        
        // Play it for all eternity!
        player!.numberOfLoops = -1
        player!.prepareToPlay()
        player!.play()
        do {
            try session.setActive(true)
        } catch let error1 as NSError {
            error = error1
        }
    }
    
    func findFileNameOfSound(selection: String) -> NSURL?
    {
        var fileName: String
        switch selection
        {
            case "Generational":
                fileName = "tng_hum_clean"
            case "Journey":
                fileName = "voy_core_1"
            default:
                fileName = "tos_ship_hum_1"
        }
        // This shouldn't really be explicitly unwrapped. It's just the only way I could make xcode stop screaming at me.
        
        if let fileURL = NSBundle.mainBundle().URLForResource(fileName, withExtension: "mp3")
        {
            print(fileURL)
            return fileURL
        }
        else
        {
            return nil
        }
    }
    
    func stopPlaying()
    {
        player = nil
    }
}
    

    
