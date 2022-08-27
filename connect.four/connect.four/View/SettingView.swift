//
//  SettingView.swift
//  connect.four
//
//  Created by Cuong Nguyen Quoc on 21/08/2022.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var currentUser: CurrentUserData
    @FocusState private var userNameFieldIsFocus : Bool
    
    @AppStorage("playerPiecesColor") var playerPiecesColor = Color.red
    @AppStorage("computerPiecesColor") var computerPiecesColor = Color.yellow
    
    var body: some View {
        List {
            Section(header: Text("Piece Color")) {
                ColorPicker("Player Piece Color", selection: $playerPiecesColor)
                ColorPicker("AI Piece Color", selection: $computerPiecesColor)
            }
            
            Section(header: Text("Current Score")) {
                Text("Current Score: \(currentUser.currentUser.score)")
            }
            Section(header: Text("Change User name")){
                TextField(
                    "User name",
                    text: $currentUser.currentUser.name
                )
                .focused($userNameFieldIsFocus)
                .onSubmit {
                    currentUser.changeName(currentUser.currentUser.name)
                }
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .border(.secondary)
                Text(currentUser.currentUser.name)
                    .onAppear{
                        userNameFieldIsFocus = false
                    }
                    .foregroundColor(userNameFieldIsFocus ? .red : .blue)
            }
            Section(header: Text("Difficulty setting")){
                VStack{
                    Picker("Level", selection: $currentUser.currentUser.selectedLevel) {
                        Text("Random").tag(Level.random)
                        Text("Easy").tag(Level.easy)
                        Text("Hard").tag(Level.hard)
                    }
                    .onChange(of: currentUser.currentUser.selectedLevel) { tag in
                        currentUser.saveSetting()
                    }
                    
                }
                .pickerStyle(.segmented)
            }
            Section(header: Text("Version: 1.0.0")) {}
        }
        .listStyle(.grouped)
        .navigationTitle("Settings")
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
            .environmentObject(CurrentUserData())
    }
}
