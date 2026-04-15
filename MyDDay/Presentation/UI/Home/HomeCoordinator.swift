//
//  HomeCoordinator.swift
//  MyDDay
//
//  Created by Yuventius Choi on 4/15/26.
//

import SwiftUI

struct HomeCoordinator: View {
    let route: HomeRoute
    let di: DIContainer
    
    var body: some View {
        switch route {
        case .Home:
            HomeView(with: di)
        case .Detail(let id):
            HomeDetailView(id: id)
        }
    }
}

#Preview {
    HomeCoordinator(route: .Home, di: .preview)
}
