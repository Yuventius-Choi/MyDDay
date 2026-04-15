//
//  HomeScreen.swift
//  MyDDay
//
//  Created by Yuventius Choi on 4/15/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var vm: HomeVM
    @EnvironmentObject private var appRouter: AppRouter
    
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
            VStack {
                Text("HomeView")
                Button(action: {
                    appRouter.push(to: .Home(route: .Detail(id: UUID.init())))
                }, label: {
                    Text("To Detail")
                })
            }
        }
    }
}

#Preview {
    HomeView(with: .preview)
}
