//
//  LeaderBoardRow.swift
//  connect.four
//
//  Created by Cuong Nguyen Quoc on 26/08/2022.
//

import SwiftUI

struct LeaderBoardRow: View {
    var score: HighScore
    
    var body: some View {
        HStack{
            Spacer()
            Text(score.name)
            Spacer()
            Text(String(score.score))
            Spacer()
        }
    }
}

struct LeaderBoardRow_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardRow(score: HighScore(name: "Cuong", score: 10))
    }
}
