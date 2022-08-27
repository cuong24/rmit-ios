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

import Foundation
import SwiftUI

enum ModalType: Identifiable, View {
    case new (Int)
    case update(ToDo, Int)
    var id: String {
        switch self {
        case .new:
            return "new"
        case .update:
            return "update"
        }
    }
    
    var body: some View {
        switch self {
        case .new(let highschoolId):
            return ToDoFormView(formVM: ToDoForm(), highschoolId: highschoolId)
        case .update(let toDo, let highschoolId):
            return ToDoFormView(formVM: ToDoForm(toDo), highschoolId: highschoolId)
        }
    }
}
