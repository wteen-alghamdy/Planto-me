//
//  Enums.swift
//  Plant
//
//  Created by Wteen Alghamdy on 28/04/1447 AH.
//

//import Foundation
//
//// All Enums now conform to Codable for PersistenceManager
//enum WateringDays: String, CaseIterable, Identifiable, Codable {
//    case daily = "Every day"
//    case every2Days = "Every 2 days"
//    case every3Days = "Every 3 days"
//    case weekly = "Once a week"
//    case every10Days = "Every 10 days"
//    case biWeekly = "Every 2 weeks"
//    var id: String { self.rawValue }
//}
//
//enum Room: String, CaseIterable, Identifiable, Codable {
//    case bedroom = "Bedroom"
//    case livingRoom = "Living Room"
//    case kitchen = "Kitchen"
//    case balcony = "Balcony"
//    case bathroom = "Bathroom"
//    var id: String { self.rawValue }
//}
//
//enum LightCondition: String, CaseIterable, Identifiable, Codable {
//    case fullSun = "Full Sun"
//    case partialSun = "Partial Sun"
//    case lowLight = "Low Light"
//    var id: String { self.rawValue }
//    
//    var iconName: String {
//        switch self {
//        case .fullSun: return "sun.max.fill"
//        case .partialSun: return "cloud.sun.fill"
//        case .lowLight: return "cloud.moon.fill"
//        }
//    }
//}
//
//enum WaterAmount: String, CaseIterable, Identifiable, Codable {
//    case small = "20-50 ml"
//    case medium = "50-100 ml"
//    case large = "100-200 ml"
//    case extraLarge = "200-300 ml"
//    var id: String { self.rawValue }
//}







import Foundation

enum Room: String, CaseIterable, Codable, Identifiable {
    case bedroom = "Bedroom"
    case livingRoom = "Living Room"
    case kitchen = "Kitchen"
    case balcony = "Balcony"
    case bathroom = "Bathroom"
    var id: String { rawValue }
}

enum Light: String, CaseIterable, Codable, Identifiable {
    case fullSun = "Full sun"
    case partialSun = "Partial Sun"
    case lowLight = "Low Light"
    var id: String { rawValue }

    var icon: String {
        switch self {
        case .fullSun: return "sun.max.fill"
        case .partialSun: return "sun.max"
        case .lowLight: return "moon.fill"
        }
    }
}

enum WateringDays: String, CaseIterable, Codable, Identifiable {
    case everyDay = "Every day"
    case every2Days = "Every 2 days"
    case every3Days = "Every 3 days"
    case onceAWeek = "Once a week"
    case every10Days = "Every 10 days"
    case every2Weeks = "Every 2 weeks"

    var id: String { rawValue }
    var intervalDays: Int {
        switch self {
        case .everyDay: 1
        case .every2Days: 2
        case .every3Days: 3
        case .onceAWeek: 7
        case .every10Days: 10
        case .every2Weeks: 14
        }
    }
}

enum WaterAmount: String, CaseIterable, Codable, Identifiable {
    case ml20to50   = "20–50  ml"
    case ml50to100  = "50–100 ml"
    case ml100to200 = "100–200 ml"
    case ml200to300 = "200–300 ml"
    var id: String { rawValue }
}
