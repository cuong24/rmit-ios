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

final class LeaderBoardData : ObservableObject {
    @Published var leaderBoard: [HighScore] = load ("leaderBoard.json")
    
    func addHighScore(_ name: String,_ score: Int) {
        if (leaderBoard.count > 10){
            leaderBoard.sort{$0.score > $1.score}
            leaderBoard = leaderBoard.dropLast(1)
        }
        leaderBoard.append(HighScore(name: name, score: score))
        leaderBoard.sort{$0.score > $1.score}
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(leaderBoard)
            let string = String(data: data, encoding: .utf8)!
            save("leaderBoard.json", data: string)
        } catch {
            fatalError("Couldn't encode data")
        }
    }
}


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

func save(_ filename: String, data: String) {
    if let pathWithFilename = Bundle.main.url(forResource: filename, withExtension: nil) {
        do {
            try data.write(to: pathWithFilename,
                                 atomically: true,
                                 encoding: .utf8)
        } catch {
            fatalError("Couldn't write \(filename) to path \(pathWithFilename)")
        }
    }
}
