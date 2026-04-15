//
//  DDayMapper.swift
//  MyDDay
//
//  Created by Yuventius Choi on 4/13/26.
//

import Foundation

struct DDayMapper {
    static func toDomain(_ entity: DDayEntity) -> DDay {
        return DDay(id: entity.id, title: entity.title, date: entity.date, tag: DTagMapper.toDomain(entity.tag))
    }
    
    static func toData(_ data: DDay) -> DDayEntity {
        return DDayEntity(id: data.id, title: data.title, date: data.date, tag: DTagMapper.toData(data.tag))
    }
}
