//
//  Events.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 23/07/2023.
//

import Foundation

class UtilEvents {
    
    static let shared = UtilEvents()
    
    init(){}
    
    func formatNumber(_ value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0 // Số lượng chữ số thập phân muốn hiển thị
        return formatter.string(from: NSNumber(value: value)) ?? ""
    }
    
    func formatCurrency(_ value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0 // Số lượng chữ số thập phân muốn hiển thị
        return formatter.string(from: NSNumber(value: value)) ?? ""
    }
    
    func formatDateTime(_ dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
        if let date = formatter.date(from: dateString) {
            formatter.dateFormat = "HH:mm - dd/MM/yyyy"
            return formatter.string(from: date)
        }
        return ""
    }
    
    func formattedDate(_ date: Date, typeFormat: String? = nil) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = typeFormat ?? "dd/M/y"
        return dateFormatter.string(from: date)
    }
}
