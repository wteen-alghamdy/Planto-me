//
//  ContentView.swift
//  Planto
//
//  Created by Wteen Alghamdy on 04/05/1447 AH.
//

//second
//import SwiftUI
//
//struct ContentView: View {
//    
//    @StateObject var viewModel = PlantListViewModel()
//
//    var body: some View {
//        NavigationView {
//            if viewModel.plants.isEmpty {
//                EmptyStateView(viewModel: viewModel)
//            } else {
//                PlantListView(viewModel: viewModel)
//            }
//        }
////        .navigationTitle(Text("My Plants ").foregroundColor(.white) + Text("🌱"))
//        
//        .navigationBarTitleDisplayMode(.inline)
//        .toolbarColorScheme(.dark, for: .navigationBar)
//        .background(Color("BackgroundDark"))
//    }
//}





import SwiftUI

struct ContentView: View {
    @StateObject private var vm = PlantListViewModel()

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            BackgroundDark.ignoresSafeArea()

            VStack(spacing: 0) {
                CustomHeaderView(title: "My Plants 🌱")

                if vm.plants.isEmpty {
                    // 👉 No floating + on this screen
                    EmptyStateView { vm.showingSheet = true }
                } else if vm.showingAllDone {
                    AllDoneView()
                } else {
                    PlantListView().environmentObject(vm)
                }
            }

            // 👉 Show + only when there are plants (list or all-done screens)
            if !vm.plants.isEmpty {
                AddFloatingButton { vm.showingSheet = true }
            }
        }
        .sheet(isPresented: $vm.showingSheet) {
            SetReminderView(
                onSave: { p in vm.add(p); vm.showingSheet = false },
                onCancel: { vm.showingSheet = false }
            )
        }
        .environmentObject(vm)
    }
}
#Preview {
    ContentView()
}
