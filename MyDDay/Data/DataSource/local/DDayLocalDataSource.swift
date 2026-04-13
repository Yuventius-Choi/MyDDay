//
//  LocalDataSource.swift
//  MyDDay
//
//  Created by Yuventius Choi on 4/13/26.
//
import Foundation

protocol DDayLocalDataSource {
    func fetch() throws -> [DDayEntity]
    func fetch(by id: UUID) throws -> DDayEntity?
    func add(entity: DDayEntity) throws -> [DDayEntity]
    func update(entity: DDayEntity) throws -> [DDayEntity]
    func delete(entity: DDayEntity) throws -> [DDayEntity]
    func deleteAll() throws -> [DDayEntity]
}
