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
