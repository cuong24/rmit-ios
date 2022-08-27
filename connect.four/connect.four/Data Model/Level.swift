//
//  Level.swift
//  connect.four
//
//  Created by Cuong Nguyen Quoc on 27/08/2022.
//

import Foundation

enum Level: String, CaseIterable, Identifiable, Codable {
    case random, easy, hard
    var id: Self { self }
}
