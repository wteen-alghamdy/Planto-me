//
//  Plant.swift
//  Plant
//
//  Created by Wteen Alghamdy on 28/04/1447 AH.
//
//import Foundation
//
//struct Plant: Identifiable, Codable {
//    var id = UUID()
//    var name: String
//    var room: Room
//    var light: LightCondition
//    var wateringDays: WateringDays
//    var waterAmount: WaterAmount
//    var lastWateredDate: Date?
//    var isWateredToday: Bool = false
//}






import Foundation

struct Plant: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var room: Room
    var light: Light
    var wateringDays: WateringDays
    var water: WaterAmount
    var lastWatered: Date? // set when user marks "done"

    init(
        id: UUID = UUID(),
        name: String,
        room: Room = .bedroom,
        light: Light = .fullSun,
        wateringDays: WateringDays = .everyDay,
        water: WaterAmount = .ml20to50,
        lastWatered: Date? = nil
    ) {
        self.id = id
        self.name = name
        self.room = room
        self.light = light
        self.wateringDays = wateringDays
        self.water = water
        self.lastWatered = lastWatered
    }

    func isDue(today: Date = .now) -> Bool {
        guard let last = lastWatered else { return true }
        let days = Calendar.current.dateComponents([.day], from: last.startOfDay(), to: today.startOfDay()).day ?? 0
        return days >= wateringDays.intervalDays
    }

    func doneToday(today: Date = .now) -> Bool {
        guard let last = lastWatered else { return false }
        return Calendar.current.isDate(last, inSameDayAs: today)
    }
}

private extension Date {
    func startOfDay() -> Date { Calendar.current.startOfDay(for: self) }
}
