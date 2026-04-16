//
//  DDay.swift
//  MyDDay
//
//  Created by Yuventius Choi on 4/13/26.
//

import Foundation

struct DDay: Sendable {
    let id: UUID
    let title: String
    let date: Date
    let tag: DTag?
}

extension DDay {
    static func makeDummy() -> DDay {
        return DDay(
            id: UUID.init(),
            title: "Test Title",
            date: Date(),
            tag: DTag.makeDummy()
        )
    }
}
