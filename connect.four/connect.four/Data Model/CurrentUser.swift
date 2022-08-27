//
//  CurrentUser.swift
//  connect.four
//
//  Created by Cuong Nguyen Quoc on 26/08/2022.
//

import Foundation
struct CurrentUser: Hashable, Codable {
    var name: String
    var score: Int
    var selectedLevel: Level
}
