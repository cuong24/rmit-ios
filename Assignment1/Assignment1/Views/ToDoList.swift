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

struct ToDoList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var modalType: ModalType? = nil
    @Binding var toDos: [ToDo]
    var highschoolId: Int
    var body: some View {
        NavigationView {
            List() {
                ForEach(toDos) { toDo in
                    Button {
                        modalType = .update(toDo, highschoolId)
                    } label: {
                        Text(toDo.name)
                            .font(.title3)
                            .strikethrough(toDo.completed)
                            .foregroundColor(toDo.completed ? .green : Color(.label))
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        modalType = .new(highschoolId)
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                }
            }
        }
        .sheet(item: $modalType) { $0 }
    }
}

struct ToDoList_Previews: PreviewProvider {
    static var previews: some View {
        ToDoList(toDos: .constant([]), highschoolId: 1)
            .environmentObject(ModelData())
    }
}
