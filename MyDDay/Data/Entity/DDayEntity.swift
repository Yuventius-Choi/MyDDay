//
//  DDayDTO.swift
//  MyDDay
//
//  Created by Yuventius Choi on 4/13/26.
//

import Foundation
import SwiftData

@Model
final class DDayEntity {
    @Attribute(.unique)
    var id: UUID = UUID()
    var title: String
    var date: Date
    
    @Relationship(
        deleteRule: .cascade,
        inverse: \DTagEntity.dDay
    )
    var tag: DTagEntity?
    
    init(title: String, date: Date) {
        self.title = title
        self.date = date
    }
    
    init(id: UUID, title: String, date: Date, tag: DTagEntity?) {
        self.id = id
        self.title = title
        self.date = date
        self.tag = tag
    }
    
    func update(with entity: DDayEntity) {
        self.title = entity.title
        self.date = entity.date
        self.tag = entity.tag
    }
}
