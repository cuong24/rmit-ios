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
import Combine

final class ModelData: ObservableObject {
    @Published var highschools: [Highschool] = load("highschoolData.json")
    
    func addToDo(_ toDo: ToDo, highschoolId: Int) {
        guard let highschoolIndex = highschools.firstIndex(where: { $0.id == highschoolId}) else { return }
        highschools[highschoolIndex].toDos.append(toDo)
        
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(highschools)
            let string = String(data: data, encoding: .utf8)!
            save("highschoolData.json", data: string)
        } catch {
            fatalError("Couldn't encode data")
        }
    }
    
    func updateToDo(_ toDo: ToDo, highschoolId: Int) {
        guard let highschoolIndex = highschools.firstIndex(where: { $0.id == highschoolId}) else { return }
        guard let toDoIndex = highschools[highschoolIndex].toDos.firstIndex(where: { $0.id == toDo.id}) else { return }
        highschools[highschoolIndex].toDos[toDoIndex] = toDo

        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(highschools)
            let string = String(data: data, encoding: .utf8)!
            save("highschoolData.json", data: string)
        } catch {
            fatalError("Couldn't encode data")
        }
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

func save(_ filename: String, data: String) {
    if let pathWithFilename = Bundle.main.url(forResource: filename, withExtension: nil) {
        do {
            try data.write(to: pathWithFilename,
                                 atomically: true,
                                 encoding: .utf8)
        } catch {
            fatalError("Couldn't write \(filename) to path \(pathWithFilename)")
        }
    }
}
