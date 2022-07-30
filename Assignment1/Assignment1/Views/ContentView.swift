//
//  ContentView.swift
//  Assignment1
//
//  Created by Cuong Nguyen Quoc on 17/07/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
