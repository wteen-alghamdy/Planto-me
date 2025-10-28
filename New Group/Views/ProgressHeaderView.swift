//
//  ProgressHeaderView.swift
//  Plant
//
//  Created by Wteen Alghamdy on 28/04/1447 AH.
//


//first
//import SwiftUI
//
//struct ProgressHeaderView: View {
//    
//    @ObservedObject var viewModel: PlantListViewModel
//    
//    var progressText: String {
//        let watered = viewModel.plantsWateredTodayCount
//        let total = viewModel.totalPlantsCount
//        
//        if total == 0 {
//            return "Your plants are waiting for a sip 💧"
//        } else if watered == total {
//            return "All your plants feel loved today! 💚"
//        } else {
//            return "\(watered) of \(total) of your plants feel loved today!✨" // Added sparkle
//        }
//    }
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 10) {
//            
//            Text(progressText)
//                .font(.subheadline).fontWeight(.medium).foregroundColor(.white)
//            
//            if viewModel.totalPlantsCount > 0 {
//                ProgressView(value: viewModel.progressValue)
//                    .progressViewStyle(LinearProgressViewStyle(tint: Color("AccentTeal")))
//                    .scaleEffect(x: 1, y: 3, anchor: .center)
//                    .frame(height: 5)
//                    .clipShape(RoundedRectangle(cornerRadius: 3))
//            }
//        }
//    }
//}





//second
//import SwiftUI
//
//struct ProgressHeaderView: View {
//    
//    @ObservedObject var viewModel: PlantListViewModel
//    
//    var progressText: String {
//        let watered = viewModel.plantsWateredTodayCount
//        let total = viewModel.totalPlantsCount
//        
//        if total == 0 {
//            return "Your plants are waiting for a sip 💧"
//        } else if watered == total {
//            return "All your plants feel loved today! 💚"
//        } else {
//            return "\(watered) of \(total) of your plants feel loved today!✨"
//        }
//    }
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 10) {
//            
//            Text(progressText)
//                .font(.subheadline).fontWeight(.medium).foregroundColor(.white)
//            
//            if viewModel.totalPlantsCount > 0 {
//                ProgressView(value: viewModel.progressValue)
//                    .progressViewStyle(LinearProgressViewStyle(tint: Color("AccentTeal")))
//                    .scaleEffect(x: 1, y: 3, anchor: .center)
//                    .frame(height: 5)
//                    .clipShape(RoundedRectangle(cornerRadius: 3))
//            }
//        }
//    }
//}





//import SwiftUI
//
//struct ProgressHeaderView: View {
//    @EnvironmentObject var vm: PlantListViewModel
//
//    private var title: String {
//        let c = vm.completedTodayCount
//        let t = vm.dueToday.count
//        
//        
//        
//        let remaining = t - c
//
//                if t == 0 { return "Your plants are waiting for a sip 💦" }
//                
//                if c == t { return "All your plants feel loved today! 💚" }
//                
//               
//                return "\(c) of your plants feel loved today ✨"
//            }
//    
//    
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 10) {
//            Text(title)
//                .foregroundStyle(.white.opacity(0.9))
//                .font(.system(size: 16, weight: .medium))
//
//            GeometryReader { geo in
//                ZStack(alignment: .leading) {
//                    Capsule().fill(.white.opacity(0.12)).frame(height: 8)
//                    Capsule()
//                        .fill(AccentTeal)
//                        .frame(width: geo.size.width * vm.progress, height: 8)
//                        .animation(.easeInOut(duration: 0.45), value: vm.progress)
//                }
//            }
//            .frame(height: 8)
//        }
//        .padding(.horizontal, 20)
//        .padding(.vertical, 12)
//        .background(BackgroundDark)
//    }
//}











// ProgressHeaderView.swift

import SwiftUI

struct ProgressHeaderView: View {
    @EnvironmentObject var vm: PlantListViewModel

    private var title: String {
        let c = vm.completedTodayCount
        let t = vm.totalPlantsDueToday
        
        // Removed unused 'let remaining = t - c'

        if t > 0 && c == 0 {
                return "Your plants are waiting for a sip 💦"
            }
        
        
        if t == 0 { return "Your plants are waiting for a sip 💦"
        }
        
        
        if c == t { return "All your plants feel loved today! 💚"
        }
        
        
        return "\(c) of your plants feel loved today ✨"
    }

    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text(title)
                .foregroundStyle(.white.opacity(0.9))
                .font(.system(size: 16, weight: .medium))

            // Check against the stable total to decide if the bar should be visible
            if vm.totalPlantsDueToday > 0 {
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        Capsule().fill(.white.opacity(0.12)).frame(height: 8)
                        Capsule()
                            .fill(AccentTeal)
                            .frame(width: geo.size.width * vm.progress, height: 8)
                            .animation(.easeInOut(duration: 0.45), value: vm.progress)
                    }
                }
                .frame(height: 8)
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 12)
        .background(BackgroundDark)
    }
}
#Preview {
    ContentView()
}
