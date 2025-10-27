//
//  PlantListViewModel.swift
//  Plant
//
//  Created by Wteen Alghamdy on 28/04/1447 AH.
//

//import Foundation
//
//class PlantListViewModel: ObservableObject {
//    
//    @Published var plants: [Plant] = []
//    @Published var allRemindersAreComplete: Bool = false
//    
//    // MARK: - Progress Calculated Properties
//    var totalPlantsCount: Int { return plants.count }
//    var plantsWateredTodayCount: Int { return plants.filter { $0.isWateredToday }.count }
//    var progressValue: Double {
//        guard totalPlantsCount > 0 else { return 0.0 }
//        return Double(plantsWateredTodayCount) / Double(totalPlantsCount)
//    }
//    
//    // MARK: - Initialization
//    init() {
//        plants = PersistenceManager.load()
//        updateCompletionStatus()
//    }
//    
//    func savePlants() { PersistenceManager.save(plants: plants) }
//    
//    // MARK: - MVVM Intent Functions
//    func addPlant(newPlant: Plant) {
//        plants.append(newPlant)
//        savePlants()
//        NotificationManager.scheduleNotification(for: newPlant)
//        updateCompletionStatus()
//    }
//    
//    func deletePlant(at offsets: IndexSet) {
//        let idsToRemove = offsets.map { plants[$0].id.uuidString }
//        plants.remove(atOffsets: offsets)
//        savePlants()
//        NotificationManager.cancelNotifications(for: idsToRemove)
//        updateCompletionStatus()
//    }
//    
//    // FIX: Uses objectWillChange.send() for guaranteed redraw
//    func toggleWateredStatus(plant: Plant) {
//        if let index = plants.firstIndex(where: { $0.id == plant.id }) {
//            
//            // 🚨 CRITICAL FIX: Announce the change NOW to all observing Views
//            objectWillChange.send()
//            
//            // Modify the status
//            plants[index].isWateredToday.toggle()
//            
//            if plants[index].isWateredToday {
//                plants[index].lastWateredDate = Date()
//            }
//            
//            savePlants()
//            updateCompletionStatus()
//        }
//    }
//    
//    func updateCompletionStatus() {
//        allRemindersAreComplete = (plantsWateredTodayCount == totalPlantsCount && totalPlantsCount > 0)
//        if allRemindersAreComplete {
//            NotificationManager.scheduleCompletionNotification()
//        }
//    }
//}







//import Foundation
//
//@MainActor
//final class PlantListViewModel: ObservableObject {
//    @Published var plants: [Plant] = [] {
//        didSet { PersistenceManager.shared.save(plants) }
//    }
//    @Published var showingSheet = false
//    @Published var showingAllDone = false
//    
//    
//
//    init() {
//        plants = PersistenceManager.shared.load()
//        updateAllDone()
//    }
//
//    // MARK: CRUD
//    func add(_ plant: Plant) {
//        plants.append(plant)
//        updateAllDone()
//        Task { await NotificationManager.shared.scheduleWaterReminder(for: plant) }
//    }
//
//    func update(_ plant: Plant) {
//        guard let idx = plants.firstIndex(where: { $0.id == plant.id }) else { return }
//        plants[idx] = plant
//        updateAllDone()
//        Task { await NotificationManager.shared.scheduleWaterReminder(for: plant) }
//    }
//
//    func delete(at offsets: IndexSet) {
//        for i in offsets {
//            let id = plants[i].id.uuidString
//            Task { await NotificationManager.shared.removeNotification(id: id) }
//        }
//        plants.remove(atOffsets: offsets)
//        updateAllDone()
//    }
//
//    func delete(id: UUID) {
//        if let i = plants.firstIndex(where: { $0.id == id }) {
//            Task { await NotificationManager.shared.removeNotification(id: id.uuidString) }
//            plants.remove(at: i)
//            updateAllDone()
//        }
//    }
//
//    /// Filters all plants to find only those whose watering date is due today. Used for progress calculation.
//    var dueToday: [Plant] { plants.filter { $0.isDue(today: Date()) } }
//
//    /// Filters plants to find those that should be displayed in the list:
//    /// plants that are still due OR plants that were already completed today.
//    var displayPlants: [Plant] {
//        plants.filter { plant in
//            plant.isDue(today: Date()) || plant.doneToday(today: Date())
//        }
//    }
//    
//    
//    var totalPlantsDueToday: Int {
//            // This includes plants that are still due, AND plants that were just completed.
//            plants.filter { $0.isDue(today: Date()) || $0.doneToday(today: Date()) }.count
//        }
//
//    /// The count of plants that were due today AND have been marked as done today.
//    var completedTodayCount: Int { dueToday.filter { $0.doneToday() }.count }
//
//    var progress: Double {
//        let total = Double(dueToday.count)
//        guard total > 0 else { return 0 }
//        return Double(completedTodayCount) / total
//    }
//
//    func toggleDone(_ plant: Plant) {
//        guard let i = plants.firstIndex(of: plant) else { return }
//        if plants[i].doneToday() {
//            plants[i].lastWatered = Calendar.current.date(byAdding: .day, value: -plants[i].wateringDays.intervalDays, to: Date())
//        } else {
//            // Action: Check (Mark as done today)
//            plants[i].lastWatered = Date()
//        }
//        let updatedPlants = plants
//            plants = updatedPlants
//        updateAllDone()
//    }
//
//    private func updateAllDone() {
//        totalPlantsDueToday > 0 && completedTodayCount == totalPlantsDueToday
//    }
//}

















// PlantListViewModel.swift

import Foundation

@MainActor
final class PlantListViewModel: ObservableObject {
    @Published var plants: [Plant] = [] {
        didSet { PersistenceManager.shared.save(plants) }
    }
    @Published var showingSheet = false
    @Published var showingAllDone = false

    init() {
        plants = PersistenceManager.shared.load()
        updateAllDone()
    }

    // MARK: CRUD
    func add(_ plant: Plant) {
        plants.append(plant)
        updateAllDone()
        Task { await NotificationManager.shared.scheduleWaterReminder(for: plant) }
    }

    func update(_ plant: Plant) {
        guard let idx = plants.firstIndex(where: { $0.id == plant.id }) else { return }
        plants[idx] = plant
        updateAllDone()
        Task { await NotificationManager.shared.scheduleWaterReminder(for: plant) }
    }

    func delete(at offsets: IndexSet) {
        for i in offsets {
            let id = plants[i].id.uuidString
            Task { await NotificationManager.shared.removeNotification(id: id) }
        }
        plants.remove(atOffsets: offsets)
        updateAllDone()
    }

    func delete(id: UUID) {
        if let i = plants.firstIndex(where: { $0.id == id }) {
            Task { await NotificationManager.shared.removeNotification(id: id.uuidString) }
            plants.remove(at: i)
            updateAllDone()
        }
    }
    
    // MARK: List Filtering
    
    /// Filters all plants that are still DUE (not completed yet). Used for internal checks.
    var dueToday: [Plant] { plants.filter { $0.isDue(today: Date()) && !$0.doneToday() } }

    /// Filters plants to find those that should be displayed in the list:
    /// plants that are still due OR plants that were already completed today.
    var displayPlants: [Plant] {
        plants.filter { plant in
            plant.isDue(today: Date()) || plant.doneToday(today: Date())
        }
    }
    
    // MARK: Progress Logic (Uses stable total)

    /// The total number of plants that require action today (whether done or not).
    /// This provides a stable denominator for progress calculation.
    var totalPlantsDueToday: Int {
        plants.filter { $0.isDue(today: Date()) || $0.doneToday(today: Date()) }.count
    }

    /// The count of plants that were due today AND have been marked as done today.
    var completedTodayCount: Int {
        // Checks the total set of actionable plants, then filters for those marked as done.
        plants.filter { $0.isDue(today: Date()) || $0.doneToday(today: Date()) }
              .filter { $0.doneToday() }.count
    }

    var progress: Double {
        let total = Double(totalPlantsDueToday)
        guard total > 0 else { return 0 }
        return Double(completedTodayCount) / total
    }

    func toggleDone(_ plant: Plant) {
        guard let i = plants.firstIndex(of: plant) else { return }
        if plants[i].doneToday() {
            // Action: Un-check (Set lastWatered back to make it due again)
            plants[i].lastWatered = Calendar.current.date(byAdding: .day, value: -plants[i].wateringDays.intervalDays, to: Date())
        } else {
            // Action: Check (Mark as done today)
            plants[i].lastWatered = Date()
        }
        
        // CRITICAL FIX: Re-assign the array to force the @Published didSet and notify all views.
        let updatedPlants = plants
        plants = updatedPlants
        
        updateAllDone()
    }

    private func updateAllDone() {
        // Correctly checks completion status against the stable total.
        showingAllDone = totalPlantsDueToday > 0 && completedTodayCount == totalPlantsDueToday
    }
}
