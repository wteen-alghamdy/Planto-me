//
//  PersistenceManager.swift
//  Plant
//
//  Created by Wteen Alghamdy on 28/04/1447 AH.
//

//import Foundation
//
//class PersistenceManager {
//    private static let plantsKey = "savedPlants"
//    
//    static func save(plants: [Plant]) {
//        do {
//            let encoder = JSONEncoder()
//            let encoded = try encoder.encode(plants)
//            UserDefaults.standard.set(encoded, forKey: plantsKey)
//            UserDefaults.standard.synchronize()
//        } catch {
//            print("❌ Persistence Error: Failed to save plants: \(error.localizedDescription)")
//        }
//    }
//    
//    static func load() -> [Plant] {
//        guard let savedData = UserDefaults.standard.data(forKey: plantsKey) else { return [] }
//        do {
//            let decoder = JSONDecoder()
//            let loadedPlants = try decoder.decode([Plant].self, from: savedData)
//            return loadedPlants
//        } catch {
//            print("❌ Persistence Error: Failed to load plants: \(error.localizedDescription)")
//            return []
//        }
//    }
//}










import Foundation

final class PersistenceManager {
    static let shared = PersistenceManager()
    private init() {}

    private var url: URL {
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return dir.appendingPathComponent("plants.json")
    }

    func load() -> [Plant] {
        guard let data = try? Data(contentsOf: url) else { return [] }
        return (try? JSONDecoder().decode([Plant].self, from: data)) ?? []
    }

    func save(_ plants: [Plant]) {
        do {
            let data = try JSONEncoder().encode(plants)
            try data.write(to: url, options: .atomic)
        } catch {
#if DEBUG
            print("SAVE ERROR:", error)
#endif
        }
    }
}
