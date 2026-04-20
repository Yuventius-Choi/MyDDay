//
//  DDayRepository.swift
//  MyDDay
//
//  Created by Yuventius Choi on 4/13/26.
//

import Foundation

protocol DDayRepository {
    func fetchDDays() async throws -> [DDay]
    func addDDay(dDay: DDay) async throws -> [DDay]
    func deleteDDay(dDay: DDay) async throws -> [DDay]
    func updateDDay(dDay: DDay) async throws -> [DDay]
}
