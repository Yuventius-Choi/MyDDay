//
//  HomeDetailView.swift
//  MyDDay
//
//  Created by Yuventius Choi on 4/15/26.
//

import SwiftUI

struct HomeDetailView: View {
    let id: UUID
    
    var body: some View {
        VStack {
            Text("Detail View ID: \(id.uuidString)")
        }
    }
}

#Preview {
    HomeDetailView(id: UUID.init())
}
