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

import SwiftUI

struct LeaderBoardView: View {
    @EnvironmentObject var leaderBoardData: LeaderBoardData
    
    var body: some View {
        List {
            ForEach(leaderBoardData.leaderBoard) { score in
                LeaderBoardRow(score: score)
            }
        }
        .navigationTitle("Leader board")
        .onAppear{
            playBackgroundMusic(sound: "Wavin' Flag ", type: "mp3")
        }
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView()
            .environmentObject(LeaderBoardData())
    }
}
