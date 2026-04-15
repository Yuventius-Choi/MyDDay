//
//  AppRouter.swift
//  MyDDay
//
//  Created by Yuventius Choi on 4/15/26.
//

import Combine
import SwiftUI

enum AppRoot: Hashable {
    case Splash
    case Home(route: HomeRoute)
}

enum HomeRoute: Hashable {
    case Home
    case Detail(id: UUID)
}

final class AppRouter: ObservableObject {
    @Published
    var root: AppRoot = .Splash
    @Published
    var path = NavigationPath()
    
    func toRoot(to root: AppRoot) {
        self.root = root
        self.path = NavigationPath()
        
        switch root {
        case .Splash:
            return
        case .Home(let route):
            switch route {
            case .Home:
                return
            case .Detail(let id):
                self.path.append(route)
            }
        }
    }
}
