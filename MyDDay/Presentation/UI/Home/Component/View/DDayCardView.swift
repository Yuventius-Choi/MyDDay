//
//  SwiftUIView.swift
//  MyDDay
//
//  Created by Yuventius Choi on 4/16/26.
//

import SwiftUI

struct DDayCardView: View {
    let dDay: DDay
    
    init(dDay: DDay = DDay.makeDummy()) {
        self.dDay = dDay
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            VStack(alignment: .leading, spacing: 4) {
                Text(dDay.title)
                    .font(.headline)
                    .foregroundStyle(.white)
                    .lineLimit(2)
                HStack {
                    Text(dDay.date.toyyMMdd())
                        .font(.caption)
                        .foregroundStyle(.white)
                    Spacer(minLength: 0)
                    Text(dDay.tag?.name != nil ? dDay.tag!.name : "")
                        .font(.caption)
                        .foregroundStyle(.white)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
                .frame(maxWidth: 3, maxHeight: 50)
                .background(.white)
            VStack(alignment: .center) {
                Text(dDay.date.calDDate())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: 80)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(dDay.tag?.colorHex != nil ? Color(hex: dDay.tag!.colorHex) : .red)
        .cornerRadius(8)
        .shadow(radius: 5)
    }
}

#Preview {
    DDayCardView()
}
