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

final class CurrentGameData : ObservableObject {
    @Published var currentGame: CurrentGame = load("currentGame.json")
    
    func saveState(){
        saveCurrentGame(currentGame)
    }
    
    func newGame(){
        currentGame.holes = Array(repeating: .blank, count: TOTAL_NUMBER_OF_PIECES)
        saveCurrentGame(currentGame)
    }
}

func saveCurrentGame(_ currentGame: CurrentGame){
    do {
        let encoder = JSONEncoder()
        let data = try encoder.encode(currentGame)
        let string = String(data: data, encoding: .utf8)!
        save("currentGame.json", data: string)
    } catch {
        fatalError("Couldn't encode data")
    }
}
