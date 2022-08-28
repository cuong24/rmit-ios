/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Nguyen Quoc Cuong
  ID: 3748840
  Created  date: 25/08/2022
  Last modified: 28/08/2022
  Acknowledgement:
*/

import Foundation
import AVFoundation

// sound effect audio player
var backgroundMusic: AVAudioPlayer?
// game background audio player
var actionMusicPlayer: AVAudioPlayer?

// play sound effect
func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            actionMusicPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            actionMusicPlayer?.play()
        } catch {
            print("ERROR: Could not find and play the sound file!")
        }
    }
}

// play game background music
func playBackgroundMusic(sound: String, type: String) {
    backgroundMusic?.stop()
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            backgroundMusic = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            backgroundMusic?.numberOfLoops = -1 // for infinite times
            backgroundMusic?.play()
        } catch {
            print("ERROR: Could not find and play the sound file!")
        }
    }
}

func stopBackgoundMusic(){
    backgroundMusic?.stop()
}
