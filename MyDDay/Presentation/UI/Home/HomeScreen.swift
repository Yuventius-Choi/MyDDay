//
//  HomeScreen.swift
//  MyDDay
//
//  Created by Yuventius Choi on 4/15/26.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject private var vm: HomeVM
    
    init(with diContainer: DIContainer) {
        self._vm = StateObject(wrappedValue: diContainer.makeHomeVM())
    }
    
    var body: some View {
        if vm.state.isLoading {
            ProgressView()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        vm.send(.loaded([]))
                    }
                }
        } else {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    HomeScreen(with: .preview)
}
