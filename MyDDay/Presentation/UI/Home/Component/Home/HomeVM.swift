//
//  HomeVM.swift
//  MyDDay
//
//  Created by Yuventius Choi on 4/15/26.
//

import Combine

final class HomeVM: ObservableObject {
    private let useCase: FetchDDaysUseCase
    
    @Published
    private(set) var state = State()
    
    init(useCase: FetchDDaysUseCase) {
        self.useCase = useCase
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
        }
    }
    
    func fetch() async {
        do {
            try await send(.loaded(useCase.execute()))
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
    }
}
