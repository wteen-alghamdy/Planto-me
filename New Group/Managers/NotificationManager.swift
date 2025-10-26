//
//  NotificationManager.swift
//  Plant
//
//  Created by Wteen Alghamdy on 28/04/1447 AH.
//

//import Foundation
//import UserNotifications
//
//class NotificationManager {
//    
//    static func requestAuthorization() {
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { success, error in
//            if success { print("Notification authorization granted.") }
//        }
//    }
//    
//    static func scheduleNotification(for plant: Plant) {
//        let identifier = plant.id.uuidString
//        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [identifier])
//        
//        guard let interval = getInterval(for: plant.wateringDays) else { return }
//        
//        let content = UNMutableNotificationContent()
//        content.title = "💧 Time to Water \(plant.name)!"
//        content.body = "\(plant.name) in the \(plant.room.rawValue) needs \(plant.waterAmount.rawValue) of water."
//        content.sound = .default
//        
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: interval, repeats: true)
//        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
//        
//        UNUserNotificationCenter.current().add(request)
//    }
//    
//    static func cancelNotifications(for identifiers: [String]) {
//        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: identifiers)
//    }
//    
//    static func scheduleCompletionNotification() {
//        let content = UNMutableNotificationContent()
//        content.title = "🎉 All Plants Cared For!"
//        content.body = "Great job! All your reminders are complete for today. See you tomorrow!"
//        content.sound = .default
//        
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
//        let request = UNNotificationRequest(identifier: "allDoneConfirmation", content: content, trigger: trigger)
//        
//        UNUserNotificationCenter.current().add(request)
//    }
//    
//    private static func getInterval(for days: WateringDays) -> TimeInterval? {
//        let secondsInDay: TimeInterval = 24 * 60 * 60
//        
//        switch days {
//        case .daily: return secondsInDay
//        case .every2Days: return secondsInDay * 2
//        case .every3Days: return secondsInDay * 3
//        case .weekly: return secondsInDay * 7
//        case .every10Days: return secondsInDay * 10
//        case .biWeekly: return secondsInDay * 14
//        }
//    }
//}












import Foundation
import UserNotifications

enum NotificationError: Error { case denied }

final class NotificationManager: ObservableObject {
    static let shared = NotificationManager()
    private init() {}

    @discardableResult
    func requestAuthorization() async throws -> Bool {
        let granted = try await UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound, .badge])
        if !granted { throw NotificationError.denied }
        return granted
    }

    func scheduleWaterReminder(for plant: Plant) async {
        await removeNotification(id: plant.id.uuidString)

        let content = UNMutableNotificationContent()
        content.title = "Planto"
        content.body  = "Hey! let's water \(plant.name)"
        content.sound = .default

        // Repeat every N days (>= 60s)
        let seconds = TimeInterval(plant.wateringDays.intervalDays * 86_400)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: true)

        let req = UNNotificationRequest(
            identifier: plant.id.uuidString,
            content: content,
            trigger: trigger
        )

        do {
            try await UNUserNotificationCenter.current().add(req)
        } catch {
#if DEBUG
            print("Notif error:", error)
#endif
        }
    }

    func removeNotification(id: String) async {
        UNUserNotificationCenter.current()
            .removePendingNotificationRequests(withIdentifiers: [id])
        UNUserNotificationCenter.current()
            .removeDeliveredNotifications(withIdentifiers: [id])
    }
}
