//
//  PlantoApp.swift
//  Planto
//
//  Created by Wteen Alghamdy on 04/05/1447 AH.
//

//import SwiftUI
//
//@main
//struct PlantApp: App {
//    
//    init() {
//        // Initialization code for Navigation Bar Appearance
//        let appearance = UINavigationBarAppearance()
//        appearance.configureWithOpaqueBackground()
//        appearance.backgroundColor = UIColor(Color("BackgroundDark"))
//        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//        UINavigationBar.appearance().standardAppearance = appearance
//        UINavigationBar.appearance().scrollEdgeAppearance = appearance
//        
//        NotificationManager.requestAuthorization()
//    }
//    
//    var body: some Scene {
//        WindowGroup {
//            Text("Hello, World!")
//            ContentView()
//        }
//    }
//}




import SwiftUI

@main
struct PlantoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
                .task { try? await NotificationManager.shared.requestAuthorization() }
        }
    }
}
