//
//  Assignment1App.swift
//  Assignment1
//
//  Created by Cuong Nguyen Quoc on 17/07/2022.
//

import SwiftUI

@main
struct Assignment1App: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
