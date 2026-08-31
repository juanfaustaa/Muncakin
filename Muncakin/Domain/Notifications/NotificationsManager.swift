//
//  NotificationsManager.swift
//  Muncakin
//
//  Created by Juan Fausta Pringadi on 26/04/26.
//

import UserNotifications
import SwiftData

class NotificationsManager {
    static let shared = NotificationsManager()
    
    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if let error {
                print("Notification permission error: \(error)")
            }
        }
    }
    
    func schedulePackingReminder (for trip: Trip){
        let startDate = trip.startDate
        
        let hMinus1 = Calendar.current.date(byAdding: .day, value: -1, to: startDate)!
        
        var components = Calendar.current.dateComponents([.year, .month, .day], from: hMinus1)
        components.hour = 12
        components.minute = 0
        components.timeZone = TimeZone.current
        
        let content = UNMutableNotificationContent()
        content.title = "Jangan lupa packing! 🎒"
        content.body = "Siapkan dan periksa kembali barang yang akan dibawa sebelum pendakian Anda!"
        content.sound = .default
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        
        let request = UNNotificationRequest(
            identifier: "packing_reminder_\(trip.id)",
            content: content,
            trigger: trigger
        )
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func scheduleFinishReminder (for trip: Trip) {
        let endDate = trip.endDate
        
        let hPlus1 = Calendar.current.date(byAdding: .day, value: 1, to: endDate)!
        
        var components = Calendar.current.dateComponents([.year, .month, .day], from: hPlus1)
        components.hour = 12
        components.minute = 0
        components.timeZone = TimeZone.current
        
        let content = UNMutableNotificationContent()
        content.title = "Sudah turun gunung? ⛰️"
        content.body = "Jangan lupa selesaikan pendakianmu di aplikasi, ya!"
        content.sound = .default
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        
        let request = UNNotificationRequest(
            identifier: "finish_reminder_\(trip.id)",
            content: content,
            trigger: trigger
        )
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotifications(for trip: Trip) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [
            "packing_reminder_\(trip.id))",
            "finish_reminder_\(trip.id)"
        ])
    }
}
