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

final class CurrentUserData : ObservableObject {
    @Published var currentUser: CurrentUser = load("currentUser.json")
    
    func changeName(_ name: String) {
        currentUser.name = name
        saveCurrentUser(currentUser)
    }
    
    func newGame(){
        currentUser.score = 0
        saveCurrentUser(currentUser)
    }
    
    func winGame(){
        currentUser.score+=1
        saveCurrentUser(currentUser)
    }
    
    func loseGame(){
        currentUser.score=0
        saveCurrentUser(currentUser)
    }
    
    func saveSetting(){
        saveCurrentUser(currentUser)
    }
}

func saveCurrentUser(_ currentUser: CurrentUser){
    do {
        let encoder = JSONEncoder()
        let data = try encoder.encode(currentUser)
        let string = String(data: data, encoding: .utf8)!
        save("currentUser.json", data: string)
    } catch {
        fatalError("Couldn't encode data")
    }
}
