//
//  SetReminderViewModel.swift
//  Plant
//
//  Created by Wteen Alghamdy on 28/04/1447 AH.
//
//import Foundation
//
//class SetReminderViewModel: ObservableObject {
//    
//    @Published var plantName: String = ""
//    @Published var selectedRoom: Room = .livingRoom
//    @Published var selectedLight: LightCondition = .fullSun
//    @Published var selectedWateringDays: WateringDays = .daily
//    @Published var selectedWaterAmount: WaterAmount = .small
//    
//    var isFormValid: Bool {
//        return !plantName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
//    }
//    
//    func createPlantModel() -> Plant {
//        let finalName = plantName.trimmingCharacters(in: .whitespacesAndNewlines)
//        
//        return Plant(
//            name: finalName.isEmpty ? "Untitled Plant" : finalName,
//            room: selectedRoom,
//            light: selectedLight,
//            wateringDays: selectedWateringDays,
//            waterAmount: selectedWaterAmount,
//            lastWateredDate: nil,
//            isWateredToday: false
//        )
//    }
//    
//    func resetForm() {
//        plantName = ""
//        selectedRoom = .livingRoom
//        selectedLight = .fullSun
//        selectedWateringDays = .daily
//        selectedWaterAmount = .small
//    }
//}





import Foundation

@MainActor
final class SetReminderViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var room: Room = .bedroom
    @Published var light: Light = .fullSun
    @Published var watering: WateringDays = .everyDay
    @Published var water: WaterAmount = .ml20to50

    var isEditing = false
    var id: UUID?

    init() {}

    init(plant: Plant) {
        name = plant.name
        room = plant.room
        light = plant.light
        watering = plant.wateringDays
        water = plant.water
        isEditing = true
        id = plant.id
    }

    func buildPlant() -> Plant {
        Plant(id: id ?? UUID(),
              name: name.isEmpty ? "Plant" : name,
              room: room,
              light: light,
              wateringDays: watering,
              water: water,
              lastWatered: nil)
    }
}
