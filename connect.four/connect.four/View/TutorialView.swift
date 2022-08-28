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

struct TutorialView: View {
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text("Connect 4 is a two-player connection board game, in which the players choose a color and then take turns dropping colored tokens into a seven-column, six-row vertically suspended grid. The pieces fall straight down, occupying the lowest available space within the column. The objective of the game is to be the first to form a horizontal, vertical, or diagonal line of four of one's own tokens. Connect Four is a solved game. The first player can always win by playing the right moves.")
                Spacer()
            }
        }

    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
