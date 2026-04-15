//
//  TagDTO.swift
//  MyDDay
//
//  Created by Yuventius Choi on 4/13/26.
//

import Foundation
import SwiftData

@Model
final class DTagEntity {
    @Attribute(.unique)
    var id: UUID = UUID()
    var name: String
    var colorHex: String
    var dDay: DDayEntity?
    
    init(name: String, colorHex: String) {
        self.name = name
        self.colorHex = colorHex
    }
    
    init(id: UUID, name: String, colorHex: String, dDay: DDayEntity?) {
        self.id = id
        self.name = name
        self.colorHex = colorHex
        self.dDay = dDay
    }
}
