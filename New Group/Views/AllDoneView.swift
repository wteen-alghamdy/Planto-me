//
//  AllDoneView.swift
//  Plant
//
//  Created by Wteen Alghamdy on 28/04/1447 AH.
//

//import SwiftUI
//
//struct AllDoneView: View {
//    
//    @ObservedObject var viewModel: PlantListViewModel
//    @Environment(\.dismiss) var dismiss
//
//    var body: some View {
//        ZStack {
//            Color("BackgroundDark").edgesIgnoringSafeArea(.all)
//            
//            VStack(spacing: 30) {
//                
//                Spacer()
//                
//                Image("WinkingPlant")
//                    .resizable().scaledToFit().frame(width: 250, height: 250)
//                
//                Text("All Done! 🥳")
//                    .font(.largeTitle).fontWeight(.heavy).foregroundColor(Color("AccentTeal"))
//                
//                Text("All Reminders Completed") // Simplified text to match screenshot
//                    .font(.title3).foregroundColor(.white)
//                
//                Spacer()
//                
//                Button {
//                    viewModel.allRemindersAreComplete = false
//                    dismiss()
//                } label: {
//                    Text("Review My Plants")
//                        .font(.headline).fontWeight(.semibold).foregroundColor(Color("AccentTeal"))
//                        .padding().frame(maxWidth: .infinity).background(Color("InputBackground")).cornerRadius(10)
//                }
//                .padding(.horizontal, 30).padding(.bottom, 50)
//            }
//        }
//    }
//}








import SwiftUI

struct AllDoneView: View {
    var body: some View {
        VStack {
            Spacer()
            Image("WinkingPlant")
                .resizable()
                .scaledToFit()
                .frame(width: 220, height: 220)
            Text("All Done! 🎉")
                .font(.system(size: 28, weight: .bold, design: .rounded))
                .foregroundStyle(.white)
                .padding(.top, 10)
            Text("All Reminders Completed")
                .foregroundStyle(.white.opacity(0.6))
                .padding(.top, 4)
            Spacer()
        }
        .background(BackgroundDark)
    }
}
