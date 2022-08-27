/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 1
  Author: Nguyen Quoc Cuong
  ID: 3748840
  Created  date: 17/07/2022
  Last modified: 17/07/2022
*/

import SwiftUI

struct HighschoolList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false

    var filteredHighschools: [Highschool] {
        modelData.highschools.filter { highschool in
            (!showFavoritesOnly || highschool.isFavorite)
        }
    }

    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }

                ForEach(filteredHighschools) { highschool in
                    NavigationLink {
                        HighschoolDetail(highschool: highschool)
                    } label: {
                        HighschoolRow(highschool: highschool)
                    }
                }
            }
            .navigationTitle("High schools")
        }
    }
}

struct HighschoolList_Previews: PreviewProvider {
    static var previews: some View {
        HighschoolList()
            .environmentObject(ModelData())
    }
}
