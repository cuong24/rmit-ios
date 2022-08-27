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

struct HighschoolDetail: View {
    @EnvironmentObject var modelData: ModelData
    @State private var modalType: ModalType? = nil
    var highschool: Highschool

    var highschoolIndex: Int {
        modelData.highschools.firstIndex(where: { $0.id == highschool.id })!
    }

    var body: some View {
        ScrollView {
            MapView(coordinate: highschool.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)

            CircleImage(image: highschool.image)
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                HStack {
                    Text(highschool.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.highschools[highschoolIndex].isFavorite)
                }

                HStack {
                    Text(highschool.category)
                    Spacer()
                    Text(highschool.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()

                Text("About \(highschool.name)")
                    .font(.title2)
                Text(highschool.description)
                
                Divider()
                
                Button(action: {
                    print("Todo")
                }, label: {
                    NavigationLink(destination: ToDoList(toDos: $modelData.highschools[highschoolIndex].toDos, highschoolId: highschool.id)) {
                        Text("Todo")
                    }
                })
            }
            .padding()
        }
        .navigationTitle(highschool.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HighschoolDetail_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        HighschoolDetail(highschool: modelData.highschools[0])
            .environmentObject(modelData)
    }
}
