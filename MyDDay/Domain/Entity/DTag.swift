//
//  Tag.swift
//  MyDDay
//
//  Created by Yuventius Choi on 4/13/26.
//

import Foundation

struct DTag: Sendable {
    let id: UUID
    let name: String
    let colorHex: String
}

extension DTag {
    static func makeDummy() -> DTag {
        return DTag(
            id: UUID.init(),
            name: "Test Name",
            colorHex: "FF000000"
        )
    }
}
