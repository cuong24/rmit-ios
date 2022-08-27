//
//  HighScore.swift
//  connect.four
//
//  Created by Cuong Nguyen Quoc on 26/08/2022.
//

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
