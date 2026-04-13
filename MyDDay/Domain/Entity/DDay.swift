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
