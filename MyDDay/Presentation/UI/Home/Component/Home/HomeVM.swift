//
//  HomeVM.swift
//  MyDDay
//
//  Created by Yuventius Choi on 4/15/26.
//

import Combine

final class HomeVM: ObservableObject {
    private let fetchUseCase: FetchDDaysUseCase
    private let addUseCase: AddDDayUseCase
    private let deleteUseCase: DeleteDDayUseCase
    
    @Published
    private(set) var state = State()
    
    init(
        fetchUseCase: FetchDDaysUseCase,
        addUseCase: AddDDayUseCase,
        deleteUseCase: DeleteDDayUseCase
    ) {
        self.fetchUseCase = fetchUseCase
        self.addUseCase = addUseCase
        self.deleteUseCase = deleteUseCase
    }
    
    
    func send(_ action: Action) async {
        switch action {
        case .onAppear:
            print("onAppear")
            await fetch()
        case .refresh:
            print("onRefresh")
        case .loaded(let items):
            state.isLoading = false
            state.dDays = items
        case .append(let item):
            await add(dDay: item)
        case .delete(let item):
            await delete(dDay: item)
            
        }
    }
    
    private func fetch() async {
        do {
            try await send(.loaded(fetchUseCase.execute()))
        } catch {
            print(error)
        }
    }
    
    private func add(dDay: DDay) async {
        do {
            try await send(.loaded(addUseCase.execute(dDay: dDay)))
        } catch {
            print(error)
        }
    }
    
    
    private func delete(dDay: DDay) async {
        do {
            try await send(.loaded(deleteUseCase.execute(dDay: dDay)))
        } catch {
            print(error)
        }
    }
    
    struct State {
        var isLoading: Bool = true
        var dDays: [DDay] = []
    }
    
    enum Action {
        case onAppear
        case refresh
        case loaded([DDay])
        case append(DDay)
        case delete(DDay)
    }
}
