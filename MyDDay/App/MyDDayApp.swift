//
//  MyDDayApp.swift
//  MyDDay
//
//  Created by Yuventius Choi on 4/13/26.
//

import SwiftUI
import SwiftData

@main
struct MyDDayApp: App {
    private let diContainer: DIContainer = DIContainer(container: .view)

    var body: some Scene {
        WindowGroup {
            HomeScreen(with: diContainer)
        }
    }
}
