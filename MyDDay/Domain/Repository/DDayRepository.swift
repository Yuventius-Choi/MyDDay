//
//  DDayRepository.swift
//  MyDDay
//
//  Created by Yuventius Choi on 4/13/26.
//

import Foundation

protocol DDayRepository {
    func fetchDDays() async throws -> [DDay]
}
