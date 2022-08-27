//
//  connect_fourApp.swift
//  connect.four
//
//  Created by Cuong Nguyen Quoc on 13/08/2022.
//

import SwiftUI

@main
struct connect_fourApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(LeaderBoardData())
                .environmentObject(CurrentUserData())
                .environmentObject(CurrentGameData())
        }
    }
}
