//
//  DIContainer.swift
//  MyDDay
//
//  Created by Yuventius Choi on 4/13/26.
//

import Foundation
import SwiftData

final class DIContainer {
    let container: ModelContainer
    
    init(container: ModelContainer) {
        self.container = container
    }
    
    func makeHomeVM() -> HomeVM {
        return HomeVM(
            fetchUseCase: makeFetchDDaysUseCase(),
            addUseCase: makeAddDDaysUseCase(),
            deleteUseCase: makeDeleteDDaysUseCase()
        )
    }
    
    private func makeFetchDDaysUseCase() -> FetchDDaysUseCase {
        return FetchDDaysUseCase(repository: makeDDayRepository())
    }
    
    private func makeAddDDaysUseCase() -> AddDDayUseCase {
        return AddDDayUseCase(repository: makeDDayRepository())
    }
    
    private func makeUpdateDDaysUseCase() -> UpdateDDayUseCase {
        return UpdateDDayUseCase(repository: makeDDayRepository())
    }
    
    private func makeDeleteDDaysUseCase() -> DeleteDDayUseCase {
        return DeleteDDayUseCase(repository: makeDDayRepository())
    }
    
    private func makeDDayRepository() -> DDayRepository {
        let dataSource = DDayLocalDataSourceImpl(container: container)
        return DDayRepositoryImpl(dataSource: dataSource)
    }
}
