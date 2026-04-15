//
//  DDayLocalDataSourceImpl.swift
//  MyDDay
//
//  Created by Yuventius Choi on 4/13/26.
//

import Foundation
import SwiftData

final class DDayLocalDataSourceImpl: DDayLocalDataSource {
    
    private let context: ModelContext
    
    init(container: ModelContainer) {
        self.context = ModelContext(container)
    }
    
    func fetch() throws -> [DDayEntity] {
        try context.fetch(FetchDescriptor<DDayEntity>())
    }
    
    func fetch(by id: UUID) throws -> DDayEntity? {
        var descriptor = FetchDescriptor<DDayEntity>(
            predicate: #Predicate { $0.id == id }
        )
        descriptor.fetchLimit = 1
        
        return try context.fetch(descriptor).first
    }
    
    func add(entity: DDayEntity) throws -> [DDayEntity] {
        context.insert(entity)
        try context.save()
        return try fetch()
    }
    
    func update(entity: DDayEntity) throws -> [DDayEntity] {
        guard let target = try fetch(by: entity.id) else {
            print("ERROR: 대상을 찾을 수 없습니다.")
            return try fetch()
        }
        target.update(with: entity)
        try context.save()
        return try fetch()
    }
    
    func delete(entity: DDayEntity) throws -> [DDayEntity] {
        context.delete(entity)
        try context.save()
        return try fetch()
    }
    
    func deleteAll() throws -> [DDayEntity] {
        try context.delete(model: DDayEntity.self)
        try context.save()
        return try fetch()
    }
}
