//
//  AnimalModel.swift
//  ThirdWeekSecondHomeWork
//
//  Created by Ali Rıza İLHAN on 21.11.2022.
//

import Foundation
import AVFoundation

 var player: AVAudioPlayer?
struct Animal : AnimalProtocol {
    
    var name: String = ""
    var sound: String = ""
    var zooKeeper: ZooKeeper? = nil
    var waterRequirement: Int = 0
    var animalType: AnimalType = .cat
   
    init() {}
    
     func getSound() {
         print("Sound is \(self.sound).mp3")
         guard let url = Bundle.main.url(forResource: self.sound, withExtension:".mp3") else { return }
        do {
            try player = AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    
}
