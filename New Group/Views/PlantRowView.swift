//
//  PlantRowView.swift
//  Plant
//
//  Created by Wteen Alghamdy on 28/04/1447 AH.
//


//first
//import SwiftUI
//
//struct PlantRowView: View {
//    
//    @Binding var plant: Plant
//    @ObservedObject var viewModel: PlantListViewModel
//    let accentColor = Color("AccentTeal")
//
//    var body: some View {
//        HStack(alignment: .top) {
//            
//            // 1. Checkmark
//            Button {
//                plant.isWateredToday.toggle()
//                viewModel.toggleWateredStatus(plant: plant)
//            } label: {
//                Image(systemName: plant.isWateredToday ? "checkmark.circle.fill" : "circle")
//                    .font(.title2)
//                    .foregroundColor(plant.isWateredToday ? accentColor : .gray)
//            }.buttonStyle(.plain).padding(.trailing, 10)
//            
//            // 2. Plant Icon (Using a custom image)
//            Image("SmallPottedPlant")
//                .resizable().scaledToFit().frame(width: 25, height: 25) // Reduced size for list row
//            
//            // 3. Plant Details (Fixed Layout)
//            VStack(alignment: .leading, spacing: 2) {
//                
//                // A. Room/Location (Top, Smallest Font)
//                HStack {
//                    Image(systemName: "mappin.and.ellipse")
//                        .foregroundColor(.gray)
//                    Text("in \(plant.room.rawValue)").foregroundColor(.gray)
//                }.font(.caption) // Smallest font for secondary info
//                
//                // B. Plant Name (Largest Font)
//                Text(plant.name)
//                    .font(.title3) // Larger font size for prominence
//                    .fontWeight(.medium).foregroundColor(.white)
//                
//                // C. Light and Water (Grouped at the bottom)
//                HStack(spacing: 15) {
//                    
//                    HStack(spacing: 4) { // Light
//                        Image(systemName: plant.light.iconName).foregroundColor(.gray)
//                        Text(plant.light.rawValue).foregroundColor(.gray)
//                    }
//                    
//                    HStack(spacing: 4) { // Water Amount
//                        Image(systemName: "drop.fill").foregroundColor(.gray)
//                        Text(plant.waterAmount.rawValue).foregroundColor(.gray)
//                    }
//                }.font(.subheadline) // Slightly larger font than the location
//            }
//            .padding(.leading, 5) // Add spacing between icon and text
//            
//            Spacer()
//            
//            Image(systemName: "chevron.right").foregroundColor(.gray).font(.caption)
//        }
//        .padding(.vertical, 10)
//        .padding(.horizontal, 10) // Add horizontal padding to lift off screen edge
//        .listRowBackground(Color("BackgroundDark"))
//    }
//}






//second
//import SwiftUI
//
//struct PlantRowView: View {
//    
//    @Binding var plant: Plant
//    @ObservedObject var viewModel: PlantListViewModel
//    let accentColor = Color("AccentTeal")
//
//    var body: some View {
//        HStack(alignment: .top) {
//            
//            // 1. Checkmark
//            Button { viewModel.toggleWateredStatus(plant: plant) } label: {
//                Image(systemName: plant.isWateredToday ? "checkmark.circle.fill" : "circle")
//                    .font(.title2).foregroundColor(plant.isWateredToday ? accentColor : .gray)
//            }.buttonStyle(.plain).padding(.trailing, 10)
//            
//            // 2. Plant Icon
//            Image("SmallPottedPlant")
//                .resizable().scaledToFit().frame(width: 25, height: 25)
//            
//            // 3. Plant Details (Fixed Layout)
//            VStack(alignment: .leading, spacing: 2) {
//                
//                // A. Room/Location (Top, Smallest Font)
//                HStack {
//                    Image(systemName: "mappin.and.ellipse").foregroundColor(.gray)
//                    Text("in \(plant.room.rawValue)").foregroundColor(.gray)
//                }.font(.caption)
//                
//                // B. Plant Name (Largest Font)
//                Text(plant.name).font(.title3).fontWeight(.medium).foregroundColor(.white)
//                
//                // C. Light and Water (Grouped at the bottom)
//                HStack(spacing: 15) {
//                    HStack(spacing: 4) {
//                        Image(systemName: plant.light.iconName).foregroundColor(.gray)
//                        Text(plant.light.rawValue).foregroundColor(.gray)
//                    }
//                    HStack(spacing: 4) {
//                        Image(systemName: "drop.fill").foregroundColor(.gray)
//                        Text(plant.waterAmount.rawValue).foregroundColor(.gray)
//                    }
//                }.font(.subheadline)
//            }.padding(.leading, 5)
//            
//            Spacer()
//            
//            Image(systemName: "chevron.right").foregroundColor(.gray).font(.caption)
//        }
//        .padding(.vertical, 10).padding(.horizontal, 10)
//        .listRowBackground(Color("BackgroundDark"))
//    }
//}






//import SwiftUI
//
//struct PlantRowView: View {
//    let plant: Plant
//    let onToggle: () -> Void
//
//    
//    var isCompleted: Bool { plant.doneToday() }
//    
//    
//    
//    
//    var body: some View {
//        
//        HStack(spacing: 12) {
////                CheckButton(checked: plant.doneToday(), action: onToggle)
//            CheckButton(checked: isCompleted, action: onToggle)
//        
//        
//        VStack(alignment: .leading, spacing: 8) {
//
//            // location label
//            HStack(spacing: 8) {
//                Image(systemName: "paperplane")
//                    .font(.system(size: 13, weight: .semibold))
//                    .foregroundStyle(.white.opacity(0.6))
//                Text("in \(plant.room.rawValue)")
//                    .font(.system(size: 13))
//                    .foregroundStyle(.white.opacity(0.6))
//                Spacer()
//            }
//
//            // name + check
//           
//
//                Text(plant.name)
//                    .font(.system(size: 30, weight: .semibold,))
//                    .foregroundStyle(.white)
//                    .lineLimit(1)
//                Spacer()
//            }
//            .padding(.top, 2)
//
//            // tags
//            HStack(spacing: 8) {
//                Tag(icon: plant.light.icon, text: plant.light.rawValue, iconColor: Color.yellow.opacity(0.7))
//                Tag(icon: "drop.fill", text: plant.water.rawValue, iconColor: Color.blue.opacity(0.7))
//            }
//        }
//        .opacity(isCompleted ? 0.4 : 1.0)
//        
//        .padding(.vertical, 10)
//        .listRowSeparator(.hidden)       // match mock (no default separators)
//    }
//}
//
//struct CheckButton: View {
//    let checked: Bool
//    let action: () -> Void
//    var body: some View {
//        Button(action: action) {
//            ZStack {
//                Circle().strokeBorder(.white.opacity(0.5), lineWidth: 2).frame(width: 22, height: 22)
//                if checked {
//                    Circle().fill(AccentTeal).frame(width: 22, height: 22)
//                    Image(systemName: "checkmark")
//                        .font(.system(size: 12, weight: .bold))
//                        .foregroundStyle(.black)
//                }
//            }
//        }
//        .buttonStyle(.plain)
//    }
//}













// PlantRowView.swift

//import SwiftUI
//
//struct PlantRowView: View {
//    let plant: Plant
//    let onToggle: () -> Void
//    let icon: String
//    let text: String
//    let iconColor: Color
//
//    var isCompleted: Bool { plant.doneToday() }
//    
//    var body: some View {
//        HStack(alignment: .top, spacing: 12) {
//
//            CheckButton(checked: isCompleted, action: onToggle)
//            
//            // 2. Plant Details (VStack)
//            VStack(alignment: .leading, spacing: 8) {
//
//                // location label
//                HStack(spacing: 8) {
//                    Image(systemName: "paperplane")
//                        .font(.system(size: 13, weight: .regular))
//                        .foregroundStyle(.white.opacity(0.6))
//                    Text("in \(plant.room.rawValue)")
//                        .font(.system(size: 13))
//                        .foregroundStyle(.white.opacity(0.6))
//                    Spacer()
//                }
//
//                // name
//                Text(plant.name)
//                    .font(.system(size: 28, weight: .regular, design: .rounded))
//                    .foregroundStyle(.white)
//                    .lineLimit(1)
//                    .padding(.top, 2)
//
//                ZStack{
//                    // tags
//                    HStack(spacing: 8) {
//                        // Light Tag (Yellow/Sun color)
//                        Tag(icon: plant.light.icon, text: plant.light.rawValue, iconColor: Color.yellow.opacity(0.7))
//                        // Water Tag (AccentTeal color)
//                        Tag(icon: "drop.fill", text: plant.water.rawValue, iconColor: AccentTeal)
//                    }
//                    
//                    RoundedRectangle(cornerRadius: 14)
//                                    .fill(Color.primary.opacity(0.08))
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 14)
//                                            .stroke(Color.primary.opacity(0.08), lineWidth: 1))
//
//                }
//            }
//            // ✅ FIX: Apply opacity ONLY to the details VStack
//            .opacity(isCompleted ? 0.4 : 1.0)
//            
//            Spacer(minLength: 0)
//        }
//        .padding(.vertical, 10)
//        .listRowSeparator(.hidden)
//    }
//}
//
//// MARK: - Helper Components (Required for PlantRowView to compile)
//
//struct CheckButton: View {
//    let checked: Bool
//    let action: () -> Void
//    var body: some View {
//        Button(action: action) {
//            ZStack {
//                // Outer circle border (fades slightly with the row, but remains visible)
//                Circle().strokeBorder(.white.opacity(0.5), lineWidth: 2).frame(width: 22, height: 22)
//                if checked {
//                    // Checkmark is always filled with AccentTeal when checked
//                    Circle().fill(AccentTeal).frame(width: 22, height: 22)
//                    Image(systemName: "checkmark")
//                        .font(.system(size: 12, weight: .bold))
//                        .foregroundStyle(.black)
//                }
//            }
//        }
//        .buttonStyle(.plain)
//    }
//}
//
//struct Tag: View {
//    let icon: String
//    let text: String
//    let iconColor: Color // Used for the icon
//    var body: some View {
//        HStack(spacing: 6) {
//            Image(systemName: icon)
//                .foregroundStyle(iconColor)
//            Text(text)
//        }
//        .font(.system(size: 12, weight: .semibold))
//        .foregroundStyle(.white.opacity(0.7))
//        .padding(.horizontal, 10)
//        .padding(.vertical, 6)
//        .background(.white.opacity(0.08))
//        .clipShape(Capsule())
//    }
//}
//#Preview {
//    ContentView()
//}



// PlantRowView.swift

import SwiftUI

struct PlantRowView: View {
    // ✅ CORRECT PROPERTIES: Only the necessary properties for the row
    let plant: Plant
    let onToggle: () -> Void

    var isCompleted: Bool { plant.doneToday() }
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {

            // 1. Check Button - NOT FADED
            CheckButton(checked: isCompleted, action: onToggle)
            
            // 2. Plant Details (VStack)
            VStack(alignment: .leading, spacing: 8) {

                // location label
                HStack(spacing: 8) {
                    Image(systemName: "paperplane")
                        .font(.system(size: 13, weight: .regular))
                        .foregroundStyle(.white.opacity(0.6))
                    Text("in \(plant.room.rawValue)")
                        .font(.system(size: 13))
                        .foregroundStyle(.white.opacity(0.6))
                    Spacer()
                }

                // name
                Text(plant.name)
                    .font(.system(size: 28, weight: .regular, ))
                    .foregroundStyle(.white)
                    .lineLimit(1)
                    .padding(.top, 2)

                // tags
                
                HStack(spacing: 8) {
                    // Light Tag (Yellow/Sun color)
                    Tag(icon: plant.light.icon, text: plant.light.rawValue, iconColor: Color.yellow.opacity(0.7))
                    // Water Tag (AccentTeal color)
                    Tag(icon: "drop.fill", text: plant.water.rawValue, iconColor: Color.blue.opacity(0.7))

                }
            }
            // ✅ Apply opacity ONLY to the details VStack
            .opacity(isCompleted ? 0.4 : 1.0)
            
            Spacer(minLength: 0)
        }
        .padding(.vertical, 10)
        .listRowSeparator(.hidden)
    }
}


// MARK: - Helper Components (Required for PlantRowView to compile)

struct CheckButton: View {
    let checked: Bool
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            ZStack {
                // Outer circle border (fades slightly with the row, but remains visible)
                Circle().strokeBorder(.white.opacity(0.5), lineWidth: 2).frame(width: 22, height: 22)
                if checked {
                    // Checkmark is always filled with AccentTeal when checked
                    Circle().fill(AccentTeal).frame(width: 22, height: 22)
                    Image(systemName: "checkmark")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(.black)
                }
            }
        }
        .buttonStyle(.plain)
    }
}

struct Tag: View {
    let icon: String
    let text: String
    let iconColor: Color // Used for the icon
    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: icon)
                .foregroundStyle(iconColor)
            Text(text)
        }
        .font(.system(size: 12, weight: .semibold))
        .foregroundStyle(.white.opacity(0.7))
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
        .background(.white.opacity(0.08))
        .clipShape(Capsule()) // This creates the rounded background matching the UI
    }
}
#Preview {
    ContentView()
}
