//
//  PreviewDI.swift
//  MyDDay
//
//  Created by Yuventius Choi on 4/15/26.
//

import SwiftData

extension ModelContainer {
    private static func makeContainer(isInMemory: Bool) -> ModelContainer {
        let schema = Schema([
            DDayEntity.self
        ])
        
        let config = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: isInMemory
        )
        
        do {
            return try ModelContainer(for: schema, configurations: [config])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    static var view: ModelContainer {
        makeContainer(isInMemory: false)
    }
    
    static var preview: ModelContainer {
        makeContainer(isInMemory: true)
    }
}

extension DIContainer {
    static var preview: DIContainer {
        DIContainer(container: .preview)
    }
}
