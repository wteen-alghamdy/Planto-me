//first code
//  SetReminderView.swift
//  Plant
//
//  Created by Wteen Alghamdy on 28/04/1447 AH.
//

//import SwiftUI
//
//struct SetReminderView: View {
//    
//    @ObservedObject var viewModel: PlantListViewModel
//    @StateObject var formVM = SetReminderViewModel()
//    @Environment(\.dismiss) var dismiss
//    
//    var body: some View {
//        ZStack {
//            Color("BackgroundDark").edgesIgnoringSafeArea(.all)
//            VStack(spacing: 0) {
//                CustomHeaderView(title: "Set Reminder", dismissAction: { dismiss() })
//                ScrollView {
//                    VStack(spacing: 15) {
//                        PlantNameField
//                        CareDetailsSection1
//                        CareDetailsSection2
//                        Spacer()
//                    }
//                    .padding()
//                }
//                SaveButton
//            }
//        }
//        .onDisappear { formVM.resetForm() }
//    }
//    
//    // MARK: - Sub-Views
//    var PlantNameField: some View {
//        HStack {
//            Text("Plant Name").foregroundColor(.white)
//            TextField("Pothos", text: $formVM.plantName)
//                .foregroundColor(.white).textFieldStyle(PlainTextFieldStyle()).multilineTextAlignment(.trailing)
//        }
//        .padding().background(Color("InputBackground")).cornerRadius(10)
//    }
//    
//    var CareDetailsSection1: some View {
//        VStack(spacing: 0) {
//            HStack {
//                Label("Room", systemImage: "mappin.and.ellipse").foregroundColor(.white)
//                Spacer()
//                Picker("", selection: $formVM.selectedRoom) {
//                    ForEach(Room.allCases) { room in Text(room.rawValue).tag(room).foregroundColor(.white) }
//                }.pickerStyle(.menu)
//            }.padding(.horizontal).padding(.vertical, 8)
//            
//            Divider().background(Color.gray.opacity(0.5))
//            
//            HStack {
//                Label("Light", systemImage: "sun.max").foregroundColor(.white)
//                Spacer()
//                Picker("", selection: $formVM.selectedLight) {
//                    ForEach(LightCondition.allCases) { light in
//                        Label(light.rawValue, systemImage: light.iconName).tag(light).foregroundColor(.white)
//                    }
//                }.pickerStyle(.menu)
//            }.padding(.horizontal).padding(.vertical, 8)
//        }
//        .background(Color("InputBackground")).cornerRadius(10)
//    }
//    
//    var CareDetailsSection2: some View {
//        VStack(spacing: 0) {
//            HStack {
//                Label("Watering Days", systemImage: "drop.fill").foregroundColor(.white)
//                Spacer()
//                Picker("", selection: $formVM.selectedWateringDays) {
//                    ForEach(WateringDays.allCases) { days in Text(days.rawValue).tag(days).foregroundColor(.white) }
//                }.pickerStyle(.menu)
//            }.padding(.horizontal).padding(.vertical, 8)
//            
//            Divider().background(Color.gray.opacity(0.5))
//            
//            HStack {
//                Label("Water", systemImage: "drop.circle.fill").foregroundColor(.white)
//                Spacer()
//                Picker("", selection: $formVM.selectedWaterAmount) {
//                    ForEach(WaterAmount.allCases) { amount in Text(amount.rawValue).tag(amount).foregroundColor(.white) }
//                }.pickerStyle(.menu)
//            }.padding(.horizontal).padding(.vertical, 8)
//        }
//        .background(Color("InputBackground")).cornerRadius(10)
//    }
//    
//    var SaveButton: some View {
//        Button { savePlant() } label: {
//            Text("Save Reminder").font(.headline).fontWeight(.semibold).foregroundColor(.white)
//                .padding().frame(maxWidth: .infinity).background(Color("AccentTeal")).cornerRadius(10)
//        }
//        .disabled(!formVM.isFormValid).opacity(formVM.isFormValid ? 1.0 : 0.6)
//        .padding(.horizontal).padding(.bottom, 30)
//    }
//    
//    func savePlant() {
//        guard formVM.isFormValid else { return }
//        let newPlant = formVM.createPlantModel()
//        viewModel.addPlant(newPlant: newPlant)
//        formVM.resetForm()
//        dismiss()
//    }
//}















//second code
//import SwiftUI
//
//struct SetReminderView: View {
//    
//    @ObservedObject var viewModel: PlantListViewModel
//    @StateObject var formVM = SetReminderViewModel()
//    @Environment(\.dismiss) var dismiss
//    
//    var body: some View {
//        ZStack {
//            // Background is set to the primary dark theme color
//            Color("InputBackground").edgesIgnoringSafeArea(.all)
//            
//            VStack(spacing: 0) {
//                
//                // 1. Custom Header with two buttons
//                CustomHeaderView(
//                    title: "Set Reminder",
//                    dismissAction: { dismiss() },
//                    saveAction: { savePlant() } // Calls savePlant when checkmark is tapped
//                )
//                
//                // 2. Form Content
//                ScrollView {
//                    VStack(spacing: 15) {
//                        
//                        PlantNameField
//                            .padding(.top,0)
//                        CareDetailsSection1
//                        
//                        CareDetailsSection2
//                        
//                        // Spacer() - Removed the bottom spacer since we removed the bottom button
//                    }
//                    .padding(.horizontal,0)
//                    .padding(.top,10)
//                }
//                
//                // 🚨 REMOVED: The SaveButton var block is removed from the bottom of the VSTACK
//            }
//            .presentationDetents([.large]) // Optional: Ensures the sheet is always full height
//                .presentationDragIndicator(.hidden) // Removes the default white grabber line
//        }
//        .onDisappear { formVM.resetForm() }
//    }
//    
//    // MARK: - Sub-Views (Custom UI Components)
//    
//    var PlantNameField: some View {
//        HStack {
//            Text("Plant Name").foregroundColor(.white)
//            TextField("Pothos", text: $formVM.plantName)
//                .foregroundColor(.white)
//                .textFieldStyle(PlainTextFieldStyle())
//                .multilineTextAlignment(.trailing)
//        }
//        .padding()
//        // FIX: Increased corner radius and applied InputBackground
//        .background(Color("careBackground"))
//        .cornerRadius(12)
//    }
//    
//    var CareDetailsSection1: some View {
//        VStack(spacing: 0) {
//            // A. Room Picker
//            HStack {
//                // FIX: Used "paperplane" symbol for Room (the arrow)
//                Label("Room", systemImage: "paperplane.fill").foregroundColor(.white)
//                Spacer()
//                // FIX: Used .gray for the picker accent color
//                Picker("", selection: $formVM.selectedRoom) {
//                    ForEach(Room.allCases) { room in Text(room.rawValue).tag(room).foregroundColor(.white) }
//                }.pickerStyle(.menu).accentColor(.gray)
//            }
//            .padding(.horizontal).padding(.vertical, 8)
//            
//            Divider().background(Color.gray.opacity(0.5))
//            
//            // B. Light Picker
//            HStack {
//                // FIX: Used "sun.max" symbol for Light
//                Label("Light", systemImage: "sun.max").foregroundColor(.white)
//                Spacer()
//                Picker("", selection: $formVM.selectedLight) {
//                    ForEach(LightCondition.allCases) { light in
//                        Label(light.rawValue, systemImage: light.iconName).tag(light).foregroundColor(.white)
//                    }
//                }.pickerStyle(.menu).accentColor(.gray)
//            }
//            .padding(.horizontal).padding(.vertical, 8)
//        }
//        // FIX: Increased corner radius
//        .background(Color("careBackground"))
//        .cornerRadius(12)
//    }
//    
//    var CareDetailsSection2: some View {
//        VStack(spacing: 0) {
//            // A. Watering Days Picker
//            HStack {
//                // FIX: Used "drop.fill" symbol for Watering Days
//                Label("Watering Days", systemImage: "drop.fill").foregroundColor(.white)
//                Spacer()
//                Picker("", selection: $formVM.selectedWateringDays) {
//                    ForEach(WateringDays.allCases) { days in Text(days.rawValue).tag(days).foregroundColor(.white) }
//                }.pickerStyle(.menu).accentColor(.gray)
//            }
//            .padding(.horizontal).padding(.vertical, 8)
//            
//            Divider().background(Color.gray.opacity(0.5))
//            
//            // B. Water Amount Picker
//            HStack {
//                // FIX: Used "drop.circle.fill" symbol for Water
//                Label("Water", systemImage: "drop.circle.fill").foregroundColor(.white)
//                Spacer()
//                Picker("", selection: $formVM.selectedWaterAmount) {
//                    ForEach(WaterAmount.allCases) { amount in Text(amount.rawValue).tag(amount).foregroundColor(.white) }
//                }.pickerStyle(.menu).accentColor(.gray)
//            }
//            .padding(.horizontal).padding(.vertical, 8)
//        }
//        // FIX: Increased corner radius
//        .background(Color("careBackground"))
//        .cornerRadius(12)
//    }
//    
//    // MARK: - MVVM Intent Function
//    
//    // This is called when the checkmark (Save Button) in the header is tapped.
//    func savePlant() {
//        // Validation ensures Plant Name is present
//        guard formVM.isFormValid else { return }
//        
//        let newPlant = formVM.createPlantModel()
//        viewModel.addPlant(newPlant: newPlant)
//        
//        formVM.resetForm()
//        dismiss()
//    }
//}
//










//third code
//import SwiftUI
//
//struct SetReminderView: View {
//    
//    @ObservedObject var viewModel: PlantListViewModel
//    @StateObject var formVM = SetReminderViewModel()
//    @Environment(\.dismiss) var dismiss
//    
//    var body: some View {
//        // ZStack removed, VStack is main content container
//        VStack(spacing: 0) {
//            
//            // 1. Custom Header with two buttons
//            CustomHeaderView(
//                title: "Set Reminder",
//                dismissAction: { dismiss() },
//                saveAction: { savePlant() }
//            )
//            
//            // 2. Form Content
//            ScrollView {
//                VStack(spacing: 15) {
//                    
//                    PlantNameField
//                        .padding(.horizontal).padding(.top, 0)
//                    
//                    CareDetailsSection1
//                        .padding(.horizontal)
//                    
//                    CareDetailsSection2
//                        .padding(.horizontal)
//                    
//                    Spacer()
//                }
//                .padding(.top, 10)
//            }
//            .padding(.bottom, 20)
//        }
//        // CRITICAL FIX: Apply custom background to the sheet presentation layer
//        .ignoresSafeArea(.all, edges: .all)
//        .presentationBackground(Color("InputBackground"))
//        
//        .onDisappear { formVM.resetForm() }
//    }
//    
//    // MARK: - Sub-Views (Focus on removing horizontal padding and using custom colors)
//    
//    var PlantNameField: some View {
//        HStack {
//            Text("Plant Name").foregroundColor(.white)
//            TextField("Pothos", text: $formVM.plantName)
//                .foregroundColor(.white)
//                .textFieldStyle(PlainTextFieldStyle())
//                .multilineTextAlignment(.trailing)
//        }
//        .padding()
//        .background(Color("careBackground"))
//        .cornerRadius(12)
//    }
//    
//    var CareDetailsSection1: some View {
//        VStack(spacing: 0) {
//            HStack {
//                Label("Room", systemImage: "paperplane.fill").foregroundColor(.white)
//                Spacer()
//                Picker("", selection: $formVM.selectedRoom) {
//                    ForEach(Room.allCases) { room in Text(room.rawValue).tag(room).foregroundColor(.white) }
//                }.pickerStyle(.menu).accentColor(.gray)
//            }
//            .padding(.horizontal).padding(.vertical, 8)
//            
//            Divider().background(Color.gray.opacity(0.5))
//            
//            HStack {
//                Label("Light", systemImage: "sun.max").foregroundColor(.white)
//                Spacer()
//                Picker("", selection: $formVM.selectedLight) {
//                    ForEach(LightCondition.allCases) { light in
//                        Label(light.rawValue, systemImage: light.iconName).tag(light).foregroundColor(.white)
//                    }
//                }.pickerStyle(.menu).accentColor(.gray)
//            }
//            .padding(.horizontal).padding(.vertical, 8)
//        }
//        .background(Color("careBackground"))
//        .cornerRadius(12)
//    }
//    
//    var CareDetailsSection2: some View {
//        VStack(spacing: 0) {
//            HStack {
//                Label("Watering Days", systemImage: "drop.fill").foregroundColor(.white)
//                Spacer()
//                Picker("", selection: $formVM.selectedWateringDays) {
//                    ForEach(WateringDays.allCases) { days in Text(days.rawValue).tag(days).foregroundColor(.white) }
//                }.pickerStyle(.menu).accentColor(.gray)
//            }
//            .padding(.horizontal).padding(.vertical, 8)
//            
//            Divider().background(Color.gray.opacity(0.5))
//            
//            HStack {
//                Label("Water", systemImage: "drop.circle.fill").foregroundColor(.white)
//                Spacer()
//                Picker("", selection: $formVM.selectedWaterAmount) {
//                    ForEach(WaterAmount.allCases) { amount in Text(amount.rawValue).tag(amount).foregroundColor(.white) }
//                }.pickerStyle(.menu).accentColor(.gray)
//            }
//            .padding(.horizontal).padding(.vertical, 8)
//        }
//        .background(Color("careBackground"))
//        .cornerRadius(12)
//    }
//    
//    func savePlant() {
//        guard formVM.isFormValid else { return }
//        let newPlant = formVM.createPlantModel()
//        viewModel.addPlant(newPlant: newPlant)
//        formVM.resetForm()
//        dismiss()
//    }
//}








import SwiftUI

struct SetReminderView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var form: SetReminderViewModel
    var onSave: (Plant) -> Void
    var onCancel: () -> Void
    var onDelete: (() -> Void)?

    init(existing: Plant? = nil,
         onSave: @escaping (Plant) -> Void,
         onCancel: @escaping () -> Void,
         onDelete: (() -> Void)? = nil) {
        _form = StateObject(wrappedValue: existing == nil
                            ? SetReminderViewModel()
                            : SetReminderViewModel(plant: existing!))
        self.onSave = onSave
        self.onCancel = onCancel
        self.onDelete = onDelete
    }

    var body: some View {
        VStack(spacing: 40) {
            // MARK: Custom sheet header
            HStack {
                CircleButton(style: .cancel) { onCancel() }
                Spacer()
                Text("Set Reminder")
                    .foregroundStyle(.white)
                    .font(.system(size: 16, weight: .semibold))
                Spacer()
                // ✅ green check, not black
                CircleButton(style: .confirm) { onSave(form.buildPlant()) }
            }
            .padding(.horizontal, 16)
            .padding(.top, 8)

            
            
            
            // MARK: Plant name
            
            // MARK: - Plant name combined field
            HStack {
                Text("Plant Name")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white.opacity(0.8))
                    .padding(.leading, 14)

                Spacer(minLength: 8)

                TextField("", text: $form.name, prompt: Text("Pothos").foregroundColor(.white.opacity(0.35)))
                    .foregroundColor(.white)
                    .tint(AccentTeal)
                    .padding(.vertical, 12)
                    .padding(.trailing, 16)
            }
            .background(CareBackground)
            .clipShape(RoundedRectangle(cornerRadius: 26, style: .continuous))
            .padding(.horizontal, 16)
            .padding(.top, 8)


            // MARK: Cards
            VStack (spacing: 40) {

                // Room + Light
                Card(rounding: 30) {                     // ✅ more rounded
                    InputRow(icon: "paperplane", title: "Room") {
                        Menu {
                            ForEach(Room.allCases) { choice in
                                Button(choice.rawValue) { form.room = choice }
                            }
                        } label: {
                            ValueLabel(text: form.room.rawValue)
                        }
                    }

                    Divider().background(.white.opacity(0.08))

                    InputRow(icon: "sun.max", title: "Light") {
                        Menu {
                            ForEach(Light.allCases) { choice in
                                Button(choice.rawValue) { form.light = choice }
                            }
                        } label: {
                            ValueLabel(text: form.light.rawValue)
                        }
                    }
                }

                
                
                // Watering Days + Water
                Card(rounding: 30) {
                    InputRow(icon: "drop", title: "Watering Days") {
                        Menu {
                            ForEach(WateringDays.allCases) { choice in
                                Button(choice.rawValue) { form.watering = choice }
                            }
                        } label: {
                            ValueLabel(text: form.watering.rawValue)
                        }
                    }

                    Divider().background(.white.opacity(0.08))

                    InputRow(icon: "drop.fill", title: "Water") {
                        Menu {
                            ForEach(WaterAmount.allCases) { choice in
                                Button(choice.rawValue) { form.water = choice }
                            }
                        } label: {
                            ValueLabel(text: form.water.rawValue)
                        }
                    }
                }
            }
            .padding(.horizontal, 14)

            
            
            
            
            
            if form.isEditing, let onDelete {
                Button(role: .destructive) { onDelete() } label: {
                    Text("Delete Reminder")
                        .frame(width: 320, height: 10)
                        .padding(.vertical, 14)
                }
                .buttonStyle(.borderedProminent)
                .foregroundStyle(.red)
                .tint(CareBackground.opacity(0.95))
                .clipShape(Capsule())
                .padding(.horizontal, 16)
                .padding(.top, 2)
            }

            Spacer(minLength: 8)
        }
        // ✅ sheet background
        .background(InputBackground.ignoresSafeArea())
    }
}

// MARK: - Components

private struct Card<Content: View>: View {
    let rounding: CGFloat
    let content: Content
    init(rounding: CGFloat = 18, @ViewBuilder content: () -> Content) {
        self.rounding = rounding
        self.content = content()
    }
    var body: some View {
        VStack(spacing: 0) { content }
            .padding(12)
            .frame(width: 380, height: 100)
            .background(CareBackground) // ✅ card background
            .clipShape(RoundedRectangle(cornerRadius: rounding, style: .continuous))
    }
}

private struct InputRow<Controls: View>: View {
    let icon: String
    let title: String
    let controls: Controls
    init(icon: String, title: String, @ViewBuilder controls: () -> Controls) {
        self.icon = icon; self.title = title; self.controls = controls()
    }
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundStyle(.white.opacity(0.7))
                .frame(width: 24)
            Text(title)
                .foregroundStyle(.white)
                .font(.system(size: 17, weight: .semibold))
            Spacer()
            controls
        }
        .padding(.horizontal, 4)
        .frame(height: 46)
    }
}

private struct ValueLabel: View {
    let text: String
    var body: some View {
        HStack(spacing: 6) {
            Text(text)
                .foregroundStyle(.gray.opacity(0.9))
                .font(.system(size: 17, weight: .regular))
            Image(systemName: "chevron.up.chevron.down")
                .font(.system(size: 10, weight: .bold))
                .foregroundStyle(.white.opacity(0.7))
        }
        .contentShape(Rectangle())
    }
}

private struct CircleButton: View {
    enum Style { case cancel, confirm }
    let style: Style
    let action: () -> Void

    init(style: Style, action: @escaping () -> Void) {
        self.style = style
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .fill(style == .confirm ? AccentTeal : .white.opacity(0.08))
                    .frame(width: 36, height: 36)
                Image(systemName: style == .confirm ? "checkmark" : "xmark")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(style == .confirm ? .white : .white)
            }
        }
        .buttonStyle(.plain)
    }
}
#Preview {
    ContentView()
}
