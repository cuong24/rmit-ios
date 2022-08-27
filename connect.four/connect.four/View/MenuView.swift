//
//  MenuView.swift
//  connect.four
//
//  Created by Cuong Nguyen Quoc on 25/08/2022.
//

import SwiftUI

struct MenuView: View {
    @State private var action: Int? = 0
    @EnvironmentObject var currentGame: CurrentGameData
    
    var body: some View {
        VStack{
            HStack {
                Spacer()
                NavigationLink(destination: GameView(), tag: 1, selection: $action) {
                    EmptyView()
                }
                NavigationLink(destination: LeaderBoardView(), tag: 2, selection: $action) {
                    EmptyView()
                }
                NavigationLink(destination: TutorialView(), tag: 3, selection: $action) {
                    EmptyView()
                }
                NavigationLink(destination: GameView(), tag: 4, selection: $action){
                    EmptyView()
                }
                VStack{
                    Spacer()
                    if (currentGame.currentGame.holes.count != 0){
                        Button("Continue Game"){
                            self.action = 4
                        }
                    }
                    Spacer().frame(minHeight: 10, maxHeight: 50)
                    Button("New Game"){
                        currentGame.newGame()
                        self.action = 1
                    }
                    Spacer().frame(minHeight: 10, maxHeight: 50)
                    Button("Leader Board"){
                        self.action = 2
                    }
                    Spacer().frame(minHeight: 10, maxHeight: 50)
                    Button("Tutorial View"){
                        self.action = 3
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .environmentObject(CurrentGameData())
    }
}
