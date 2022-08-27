//
//  LeaderBoardView.swift
//  connect.four
//
//  Created by Cuong Nguyen Quoc on 26/08/2022.
//

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
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView()
            .environmentObject(LeaderBoardData())
    }
}
