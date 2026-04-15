//
//  RootView.swift
//  MyDDay
//
//  Created by Yuventius Choi on 4/15/26.
//

import SwiftUI

struct RootView: View {
    var diContainer: DIContainer
    var startRoot: AppRoot
    
    @StateObject
    var appRouter: AppRouter
    
    init(with diContainer: DIContainer, to root: AppRoot = .Splash) {
        self.diContainer = diContainer
        self._appRouter = StateObject(wrappedValue: AppRouter())
        self.startRoot = root
    }
    
    var body: some View {
        NavigationStack(path: $appRouter.path) {
            rootView()
                .navigationDestination(for: AppRoot.self) { route in
                    switch route {
                    case .Splash:
                        Text("SPLASH")
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                    appRouter.toRoot(to: .Home(route: .Home))
                                }
                            }
                    case .Home:
                        HomeScreen(with: diContainer)
                    }
                }
        }
        .environmentObject(appRouter)
    }
    
    @ViewBuilder
    private func rootView() -> some View {
        switch appRouter.root {
        case .Splash:
            Text("SPLASH")
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        appRouter.toRoot(to: .Home(route: .Home))
                    }
                }
        case .Home(let route):
            HomeScreen(with: diContainer)
        }
    }
}
