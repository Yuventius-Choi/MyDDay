//
//  SwiftUIView.swift
//  MyDDay
//
//  Created by Yuventius Choi on 4/16/26.
//

import SwiftUI

struct DDayCardView: View {
    let dDay: DDay = DDay.makeDummy()
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            VStack(alignment: .leading) {
                Text(dDay.title)
                    .font(.headline)
                    .foregroundStyle(.white)
                Text(dDay.date.ISO8601Format())
                    .font(.headline)
                    .foregroundStyle(.white)
            }
            Divider()
                .frame(width: 2, height: 50)
                .background(.white)
                .padding()
            VStack() {
                Text(dDay.date.calDDate())
                    .font(.headline)
                    .foregroundStyle(.white)
            }
        }
        .padding()
        .background(dDay.tag?.colorHex != nil ? Color(hex: dDay.tag!.colorHex) : .red)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

#Preview {
    DDayCardView()
}
