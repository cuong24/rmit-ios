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
struct HighScore: Hashable, Codable, Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var score: Int
    
    static var sampleDate: [HighScore] {
        [
            HighScore(name: "Cuong", score: 10),
            HighScore(name: "Cuong", score: 12)
        ]
    }
}
