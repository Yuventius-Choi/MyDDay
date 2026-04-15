//
//  DTagMapper.swift
//  MyDDay
//
//  Created by Yuventius Choi on 4/13/26.
//

import Foundation

struct DTagMapper {
    static func toDomain(_ entity: DTagEntity?) -> DTag? {
        guard let entity = entity else {
            return nil
        }
        
        return DTag(id: entity.id, name: entity.name, colorHex: entity.colorHex)
    }
    
    static func toData(_ data: DTag?) -> DTagEntity? {
        guard let data = data else {
            return nil
        }
        
        return DTagEntity(id: data.id, name: data.name, colorHex: data.colorHex, dDay: nil)
    }
}
