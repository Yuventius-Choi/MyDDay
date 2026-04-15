//
//  FetchDDaysUseCase.swift
//  MyDDay
//
//  Created by Yuventius Choi on 4/13/26.
//

import Foundation

final class FetchDDaysUseCase {
    private let repository: DDayRepository
    
    init(repository: DDayRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> [DDay] {
        return try await repository.fetchDDays()
    }
}
