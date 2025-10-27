//
//  PlantListView.swift
//  Plant
//
//  Created by Wteen Alghamdy on 28/04/1447 AH.
//


//first
//import SwiftUI
//
//struct PlantListView: View {
//    
//    @ObservedObject var viewModel: PlantListViewModel
//    @State private var showingSetReminderSheet = false
//    
//    var body: some View {
//        // FIX: Use NavigationView to display the custom title
//        NavigationView {
//            ZStack {
//                Color("BackgroundDark").edgesIgnoringSafeArea(.all)
//                
//                VStack {
//                    ProgressHeaderView(viewModel: viewModel)
//                        .padding(.horizontal).padding(.top, 10) // Reduced padding for top alignment
//                    
//                    List {
//                        ForEach(viewModel.plants.indices, id: \.self) { index in
//                            PlantRowView(plant: $viewModel.plants[index], viewModel: viewModel)
//                                .listRowInsets(EdgeInsets())
//                                .listRowBackground(Color("BackgroundDark"))
//                        }
//                        .onDelete(perform: deletePlant)
//                    }
//                    .listStyle(.plain)
//                }
//                
//                // Floating Add Button
//                VStack {
//                    Spacer()
//                    HStack {
//                        Spacer()
//                        Button { showingSetReminderSheet = true } label: {
//                            Image(systemName: "plus").font(.title2).fontWeight(.bold).foregroundColor(.white).padding(20)
//                                .background(Color("AccentTeal")).clipShape(Circle()).shadow(radius: 5)
//                        }
//                        .padding(.trailing, 25).padding(.bottom, 25)
//                    }
//                }
//            }
//           
//        }
//        .sheet(isPresented: $showingSetReminderSheet) {
//            SetReminderView(viewModel: viewModel)
//        }
//        .fullScreenCover(isPresented: $viewModel.allRemindersAreComplete) {
//            AllDoneView(viewModel: viewModel)
//        }
//    }
//    
//    func deletePlant(at offsets: IndexSet) {
//        viewModel.deletePlant(at: offsets)
//    }
//}


//second
//import SwiftUI
//
//struct PlantListView: View {
//    
//    @ObservedObject var viewModel: PlantListViewModel
//    @State private var showingSetReminderSheet = false
//    
//    var body: some View {
//        ZStack {
//            Color("BackgroundDark").edgesIgnoringSafeArea(.all)
//            
//            VStack(spacing: 0) {
//                
//                CustomTitleView()
//                
//                ProgressHeaderView(viewModel: viewModel)
//                    .padding(.horizontal).padding(.top, 10)
//                
//                List {
//                    ForEach(viewModel.plants.indices, id: \.self) { index in
//                        PlantRowView(plant: $viewModel.plants[index], viewModel: viewModel)
//                            .listRowInsets(EdgeInsets())
//                            .listRowBackground(Color("BackgroundDark"))
//                    }
//                    .onDelete(perform: deletePlant)
//                }
//                .listStyle(.plain)
//            }
//            
//            // Floating Add Button
//            VStack {
//                Spacer()
//                HStack {
//                    Spacer()
//                    Button { showingSetReminderSheet = true } label: {
//                        Image(systemName: "plus").font(.title2).fontWeight(.bold).foregroundColor(.white).padding(20)
//                            .background(Color("AccentTeal")).clipShape(Circle()).shadow(radius: 5)
//                    }
//                    .padding(.trailing, 25).padding(.bottom, 25)
//                }
//            }
//        }
//        .sheet(isPresented: $showingSetReminderSheet) {
//            SetReminderView(viewModel: viewModel)
//        }
//        .fullScreenCover(isPresented: $viewModel.allRemindersAreComplete) {
//            AllDoneView(viewModel: viewModel)
//        }
//    }
//    
//    func deletePlant(at offsets: IndexSet) {
//        viewModel.deletePlant(at: offsets)
//    }
//}









//import SwiftUI
//
//struct PlantListView: View {
//    @EnvironmentObject var vm: PlantListViewModel
//    @State private var editingPlant: Plant?
//
//    var body: some View {
//        VStack(spacing: 0) {
//            ProgressHeaderView().environmentObject(vm)
//
//            List {
//                Section {
//                    ForEach(vm.dueToday) { plant in
//                        PlantRowView(plant: plant, onToggle: { vm.toggleDone(plant) })
//                            .listRowBackground(BackgroundDark)
//                            .contentShape(Rectangle())
//                            .onTapGesture { editingPlant = plant }
//                            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
//                                Button(role: .destructive) {
//                                    if let idx = vm.plants.firstIndex(of: plant) {
//                                        vm.delete(at: IndexSet(integer: idx))
//                                    }
//                                } label: { Image(systemName: "trash") }
//                            }
//                    }
//                } header: {
//                    Text("Today")
//                        .foregroundStyle(.white.opacity(0.65))
//                        .font(.system(size: 14, weight: .semibold))
//                }
//            }
//            .listStyle(.plain)
//            .scrollContentBackground(.hidden)
//            .background(BackgroundDark)
//        }
//        .background(BackgroundDark)
//        .sheet(item: $editingPlant) { item in
//            SetReminderView(
//                existing: item,
//                onSave: { vm.update($0); editingPlant = nil },
//                onCancel: { editingPlant = nil },
//                onDelete: { vm.delete(id: item.id); editingPlant = nil }
//            )
//        }
//    }
//}












// PlantListView.swift

import SwiftUI

struct PlantListView: View {
    @EnvironmentObject var vm: PlantListViewModel
    @State private var editingPlant: Plant?

    var body: some View {
        VStack(spacing: 0) {
            ProgressHeaderView().environmentObject(vm)

            List {
                // FIX: Removed the 'Section' and 'header' to list items directly,
                // matching the UI design where 'Today' text is not present.
                ForEach(vm.displayPlants) { plant in
                    PlantRowView(plant: plant, onToggle: { vm.toggleDone(plant) })
                        .listRowBackground(BackgroundDark)
                        .contentShape(Rectangle())
                        .onTapGesture { editingPlant = plant }
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button(role: .destructive) {
                                if let idx = vm.plants.firstIndex(of: plant) {
                                    vm.delete(at: IndexSet(integer: idx))
                                }
                            } label: { Image(systemName: "trash") }
                        }
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .background(BackgroundDark)
        }
        .background(BackgroundDark)
        .sheet(item: $editingPlant) { item in
            SetReminderView(
                existing: item,
                onSave: { vm.update($0); editingPlant = nil },
                onCancel: { editingPlant = nil },
                onDelete: { vm.delete(id: item.id); editingPlant = nil }
            )
        }
    }
}
#Preview {
    ContentView()
}

