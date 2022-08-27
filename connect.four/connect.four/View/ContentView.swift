//
//  ContentView.swift
//  connect.four
//
//  Created by Cuong Nguyen Quoc on 13/08/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack{
                MenuView()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Text("Connect 4")
                        .bold()
                        .font(.largeTitle)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack{
                        NavigationLink {
                            SettingView()
                        } label: {
                            Image(systemName: "gear")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .padding(8.5)
                                .background(.quaternary)
                                .cornerRadius(15)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LeaderBoardData())
            .environmentObject(CurrentUserData())
            .environmentObject(CurrentGameData())
    }
}
