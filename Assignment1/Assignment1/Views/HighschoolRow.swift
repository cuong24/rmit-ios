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

struct HighschoolRow: View {
    var highschool: Highschool

    var body: some View {
        HStack {
            highschool.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(highschool.name)

            Spacer()

            if highschool.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct HighschoolRow_Previews: PreviewProvider {
    static var highschools = ModelData().highschools
    
    static var previews: some View {
        Group {
            HighschoolRow(highschool: highschools[0])
            HighschoolRow(highschool: highschools[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
