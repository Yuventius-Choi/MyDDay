//
//  DateExt.swift
//  MyDDay
//
//  Created by Yuventius Choi on 4/16/26.
//

import Foundation

extension Date {
    func calDDate() -> String {
        let now = Date()
        let remainDay = Calendar.current.dateComponents([.day], from: self, to: now).day
        guard let remainDay = remainDay else {
            return "UNKNOWN"
        }
        if remainDay == 0 {
            return "D-DAY"
        } else if (remainDay > 0) {
            return "D+\(remainDay)"
        } else {
            return "D-\(-remainDay)"
        }
    }
    
    func toyyMMdd() -> String {
        let df = DateFormatter()
        df.dateFormat = "yy / MM / dd"
        return df.string(from: self)
    }
}
