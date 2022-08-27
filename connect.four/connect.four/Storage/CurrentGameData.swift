//
//  CurrentGameData.swift
//  connect.four
//
//  Created by Cuong Nguyen Quoc on 27/08/2022.
//

import Foundation

//
//  LeaderBoardData.swift
//  connect.four
//
//  Created by Cuong Nguyen Quoc on 26/08/2022.
//

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
