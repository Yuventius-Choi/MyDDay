//
//  DDayRepositoryImpl.swift
//  MyDDay
//
//  Created by Yuventius Choi on 4/13/26.
//

import Foundation

final class DDayRepositoryImpl: DDayRepository {
    private let dataSource: DDayLocalDataSource
    
    init(dataSource: DDayLocalDataSource) {
        self.dataSource = dataSource
    }
    
    func fetchDDays() async throws -> [DDay] {
        let entities: [DDayEntity] = try dataSource.fetch()
        return entities.map {
            DDayMapper.toDomain($0)
        }
    }
    
    func addDDay(dDay: DDay) async throws -> [DDay] {
        let result: [DDayEntity] = try dataSource.add(entity: DDayMapper.toData(dDay))
        return result.map {
            DDayMapper.toDomain($0)
        }
    }
    
    func deleteDDay(dDay: DDay) async throws -> [DDay] {
        let result: [DDayEntity] = try dataSource.delete(entity: DDayMapper.toData(dDay))
        return result.map {
            DDayMapper.toDomain($0)
        }
    }
    
    func updateDDay(dDay: DDay) async throws -> [DDay] {
        let result: [DDayEntity] = try dataSource.update(entity: DDayMapper.toData(dDay))
        return result.map {
            DDayMapper.toDomain($0)
        }
    }
    
}
