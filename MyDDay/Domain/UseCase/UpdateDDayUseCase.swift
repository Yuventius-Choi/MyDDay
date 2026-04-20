//
//  UpdateDDayUseCase.swift
//  MyDDay
//
//  Created by Yuventius Choi on 4/20/26.
//

import Foundation

final class UpdateDDayUseCase {
    private let repository: DDayRepository
    
    init(repository: DDayRepository) {
        self.repository = repository
    }
    
    func execute(dDay: DDay) async throws -> [DDay] {
        return try await repository.updateDDay(dDay: dDay)
    }
}
