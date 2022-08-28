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
let TOTAL_NUMBER_OF_PIECES = 42
let NUMBER_OF_ROW = 6
let NUMBER_OF_COLLUMN = 7

struct GameView: View {
    @EnvironmentObject var leaderBoardData: LeaderBoardData
    @EnvironmentObject var currentUserData: CurrentUserData
    @EnvironmentObject var currentGameData: CurrentGameData
    
    @AppStorage("playerPiecesColor") var playerPiecesColor = Color.red
    @AppStorage("computerPiecesColor") var computerPiecesColor = Color.yellow
    
    @State private var userPieces = TOTAL_NUMBER_OF_PIECES/2
    @State private var aiPieces = TOTAL_NUMBER_OF_PIECES/2
    @State private var turn = Turn.user
    @State private var connectIdx: [Int] = []
    @State private var selectTab = 0
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                HStack{
                    Circle()
                        .frame(width: geometry.size.width/9, height: geometry.size.width/9)
                        .foregroundColor(playerPiecesColor)
                    VStack{
                        HStack{
                            Text(currentUserData.currentUser.name)
                            Spacer()
                            Text("AI")
                        }
                        .font(.title3.bold())
                        
                        HStack{
                            Text("\(userPieces)")
                            Spacer()
                            Text("vs")
                            Spacer()
                            Text("\(aiPieces)")
                        }
                    }
                    Circle()
                        .frame(width: geometry.size.width/9, height: geometry.size.width/9)
                        .foregroundColor(computerPiecesColor)
                }
                
                LazyVGrid(columns: Array(repeating: GridItem(), count: NUMBER_OF_COLLUMN)) {
                    ForEach(0..<TOTAL_NUMBER_OF_PIECES) { index in
                        switch currentGameData.currentGame.holes[index] {
                        case .blank:
                            Circle()
                                .frame(width: geometry.size.width/9 , height: geometry.size.width/9)
                                .foregroundColor(.black.opacity(0.5))
                                .onTapGesture {
                                    if turn == .user {
                                        playerTurn(index: index)
                                    }
                                }
                        case .user:
                            if connectIdx.contains(index) {
                                Circle()
                                    .strokeBorder(Color.white, lineWidth: 4)
                                    .frame(width: geometry.size.width/9 , height: geometry.size.width/9)
                                    .background(Circle().fill(playerPiecesColor))
                            } else {
                                Circle()
                                    .frame(width: geometry.size.width/9 , height: geometry.size.width/9)
                                    .foregroundColor(playerPiecesColor)
                                    .onTapGesture {
                                        if turn == .user && currentGameData.currentGame.holes[index % NUMBER_OF_COLLUMN] == .blank {
                                            playerTurn(index: index)
                                        }
                                    }
                            }
                        case .ai:
                            if connectIdx.contains(index) {
                                Circle()
                                    .strokeBorder(Color.white, lineWidth: 4)
                                    .frame(width: geometry.size.width/9 , height: geometry.size.width/9)
                                    .background(Circle().fill(computerPiecesColor))
                            } else {
                                Circle()
                                    .frame(width: geometry.size.width/9 , height: geometry.size.width/9)
                                    .foregroundColor(computerPiecesColor)
                                    .onTapGesture {
                                        if turn == .user && currentGameData.currentGame.holes[index % NUMBER_OF_COLLUMN] == .blank {
                                            
                                        }
                                    }
                            }
                        }
                    }
                }
                .padding()
                .background(.blue.opacity(0.6))
                .cornerRadius(15)
                .padding(.bottom, 10)
                
                HStack{
                    Spacer()
                    switch turn {
                    case .user:
                        Text("\(currentUserData.currentUser.name) Turn")
                            .bold()
                            .font(.title)
                    case .ai:
                        Text("AI's Turn")
                            .bold()
                            .font(.title)
                    case .userWin:
                        Text("*** You Won! ***")
                            .bold()
                            .font(.title)
                    case .aiWin:
                        Text("*** AI Won! ***")
                            .bold()
                            .font(.title)
                    case .tie:
                        Text("There was a tie.")
                            .bold()
                            .font(.title)
                        
                    }
                    Spacer()
                }
                .padding(8)
                .background(.blue.opacity(0.7))
                .cornerRadius(15)
                .padding(.bottom, 10)
                
                if (turn == .tie || turn == .userWin) {
                    HStack {
                        Spacer()
                        Button {
                            userPieces = TOTAL_NUMBER_OF_PIECES/2
                            aiPieces = TOTAL_NUMBER_OF_PIECES/2
                            currentGameData.newGame()
                            turn = .user
                            connectIdx = []
                        } label: {
                            Text("Start Next Round")
                                .bold()
                                .font(.title)
                        }
                        Spacer()
                    }
                }
                if (turn == .aiWin) {
                    HStack {
                        Spacer()
                        Button {
                            userPieces = TOTAL_NUMBER_OF_PIECES/2
                            aiPieces = TOTAL_NUMBER_OF_PIECES/2
                            currentGameData.newGame()
                            turn = .user
                            connectIdx = []
                        } label: {
                            Text("New Game")
                                .bold()
                                .font(.title)
                        }
                        Spacer()
                    }
                }
            }
            .padding()
            
        }
        .onAppear{
            stopBackgoundMusic()
        }
    }
    
    func playerTurn(index: Int) {
        turn = .ai
        userPieces -= 1
        var topIdx = index % 7
        var blankNum = 0
        while (currentGameData.currentGame.holes[topIdx] == .blank && topIdx + 7 <= 41 && currentGameData.currentGame.holes[topIdx + 7] == .blank){
            blankNum += 1
            topIdx += 7
        }
        animation(col: index, row: blankNum, currentTurn: .user)
    }
    
    func aiTurn() {
        aiPieces -= 1
        let (row, col) = aiLogic(hole: currentGameData.currentGame.holes, level: currentUserData.currentUser.selectedLevel)
        animation(col: col, row: row, currentTurn: .ai)
    }
    
    func animation(col: Int, row: Int, currentTurn: Turn) {
        playSound(sound: "mixkit-heavy-sliding-door-1523", type: "mp3")
        var idx = col % 7
        for i in 0...row {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.12*Double(i)) {
                if(idx>6) {
                    currentGameData.currentGame.holes[idx-7] = .blank
                }
                if (currentTurn == .ai){
                    currentGameData.currentGame.holes[idx] = .ai
                } else {
                    currentGameData.currentGame.holes[idx] = .user
                }
                idx += 7
                if(i == row) {
                    checkFinish()
                    currentGameData.saveState()
                    if(currentTurn == .ai) {
                        if(aiPieces == 0) {
                            turn = .tie
                        } else if (turn != .userWin && turn != .aiWin) {
                            turn = .user
                        }
                    } else if (currentTurn == .user) {
                        if (turn == .ai){
                            aiTurn()
                        }
                    }
                }
            }
        }
    }
    
    func checkFinish() {
        for row in 0...2 {
            for col in 0...6 {
                if (currentGameData.currentGame.holes[7*row+col] != .blank
                    && currentGameData.currentGame.holes[7*row+col] == currentGameData.currentGame.holes[7*row+col+7]
                    && currentGameData.currentGame.holes[7*row+col+7] == currentGameData.currentGame.holes[7*row+col+14]
                    && currentGameData.currentGame.holes[7*row+col+14] == currentGameData.currentGame.holes[7*row+col+21]) {
                    connectIdx.append(7*row+col)
                    connectIdx.append(7*row+col+7)
                    connectIdx.append(7*row+col+14)
                    connectIdx.append(7*row+col+21)
                    if(currentGameData.currentGame.holes[7*row+col] == .user) {
                        turn = .userWin
                        playSound(sound: "mixkit-small-group-cheer-and-applause-518", type: "mp3")
                        currentUserData.winGame()
                    } else {
                        turn = .aiWin
                        playSound(sound: "mixkit-lost-kid-sobbing-474", type: "mp3")
                        checkHighScore()
                    }
                    return
                }
            }
        }
        // check "-"
        for row in 0...5 {
            for col in 0...3 {
                if (currentGameData.currentGame.holes[7*row+col] != .blank
                    && currentGameData.currentGame.holes[7*row+col] == currentGameData.currentGame.holes[7*row+col+1]
                    && currentGameData.currentGame.holes[7*row+col+1] == currentGameData.currentGame.holes[7*row+col+2]
                    && currentGameData.currentGame.holes[7*row+col+2] == currentGameData.currentGame.holes[7*row+col+3]) {
                    connectIdx.append(7*row+col)
                    connectIdx.append(7*row+col+1)
                    connectIdx.append(7*row+col+2)
                    connectIdx.append(7*row+col+3)
                    if(currentGameData.currentGame.holes[7*row+col] == .user) {
                        turn = .userWin
                        playSound(sound: "mixkit-small-group-cheer-and-applause-518", type: "mp3")
                        currentUserData.winGame()
                    } else {
                        turn = .aiWin
                        playSound(sound: "mixkit-lost-kid-sobbing-474", type: "mp3")
                        checkHighScore()
                    }
                    return
                }
            }
        }
        // check "\"
        for row in 0...2 {
            for col in 0...3 {
                if (currentGameData.currentGame.holes[7*row+col] != .blank
                    && currentGameData.currentGame.holes[7*row+col] == currentGameData.currentGame.holes[7*row+col+8]
                    && currentGameData.currentGame.holes[7*row+col+8] == currentGameData.currentGame.holes[7*row+col+16]
                    && currentGameData.currentGame.holes[7*row+col+16] == currentGameData.currentGame.holes[7*row+col+24]) {
                    connectIdx.append(7*row+col)
                    connectIdx.append(7*row+col+8)
                    connectIdx.append(7*row+col+16)
                    connectIdx.append(7*row+col+24)
                    if(currentGameData.currentGame.holes[7*row+col] == .user) {
                        turn = .userWin
                        currentUserData.winGame()
                    } else {
                        turn = .aiWin
                        playSound(sound: "mixkit-lost-kid-sobbing-474", type: "mp3")
                        checkHighScore()
                    }
                    return
                }
            }
        }
        // check "/"
        for row in 0...2 {
            for col in 3...6 {
                if (currentGameData.currentGame.holes[7*row+col] != .blank
                    && currentGameData.currentGame.holes[7*row+col] == currentGameData.currentGame.holes[7*row+col+6]
                    && currentGameData.currentGame.holes[7*row+col+6] == currentGameData.currentGame.holes[7*row+col+12]
                    && currentGameData.currentGame.holes[7*row+col+12] == currentGameData.currentGame.holes[7*row+col+18]) {
                    connectIdx.append(7*row+col)
                    connectIdx.append(7*row+col+6)
                    connectIdx.append(7*row+col+12)
                    connectIdx.append(7*row+col+18)
                    if(currentGameData.currentGame.holes[7*row+col] == .user) {
                        turn = .userWin
                        playSound(sound: "mixkit-small-group-cheer-and-applause-518", type: "mp3")
                        currentUserData.winGame()
                    } else {
                        turn = .aiWin
                        playSound(sound: "mixkit-lost-kid-sobbing-474", type: "mp3")
                        checkHighScore()
                    }
                    return
                }
            }
        }
    }
    
    func checkHighScore() {
        let lowerScore = leaderBoardData.leaderBoard.filter{$0.score < currentUserData.currentUser.score}
        if (lowerScore.count > 0 || leaderBoardData.leaderBoard.count < 10) {
            leaderBoardData.addHighScore(currentUserData.currentUser.name, currentUserData.currentUser.score)
        }
        currentUserData.loseGame()
    }
}


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(LeaderBoardData())
            .environmentObject(CurrentUserData())
            .environmentObject(CurrentGameData())
    }
}
