//
//  EmptyStateView.swift
//  Plant
//
//  Created by Wteen Alghamdy on 28/04/1447 AH.
//


//first
//import SwiftUI
//
//struct EmptyStateView: View {
//    
//    @ObservedObject var viewModel: PlantListViewModel
//    @State private var showingSetReminderSheet = false
//    
//    var body: some View {
//        ZStack {
//            Color("BackgroundDark").edgesIgnoringSafeArea(.all)
//            
//            VStack(spacing: 20) {
//                Image("HappyPlant")
//                    .resizable().scaledToFit().frame(width: 250, height: 250)
//                
//                Text("Start your plant journey!")
//                    .font(.largeTitle).fontWeight(.bold).foregroundColor(.white)
//                
//                VStack(spacing: 8) {
//                    Text("Now all your plants will be in one place, and we will help you take care of them. ")
//                        .foregroundColor(.gray)
//                        .multilineTextAlignment(.center)
//                    
//                    HStack(alignment: .lastTextBaseline, spacing: 3) {
//                        Text(":)").foregroundColor(.gray)
//                        
//                        Image("SmallPottedPlant")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 18, height: 18)
//                    }
//                }
//                .font(.body)
//                .padding(.horizontal, 40)
//                
//                Spacer()
//
//                Button { showingSetReminderSheet = true } label: {
//                    Text("Set Plant Reminder").font(.headline).fontWeight(.semibold).foregroundColor(.white)
//                        .padding().frame(maxWidth: .infinity).background(Color("AccentTeal")).cornerRadius(26)
//                }
//                .padding(.horizontal, 30).padding(.bottom, 140)
//            }
//            .padding(.top, 100)
//        }
//        .sheet(isPresented: $showingSetReminderSheet) {
//            SetReminderView(viewModel: viewModel)
//        }
//    }
//}


//second
//import SwiftUI
//
//struct EmptyStateView: View {
//    
//    @ObservedObject var viewModel: PlantListViewModel
//    @State private var showingSetReminderSheet = false
//    
//    var body: some View {
//        ZStack {
//            Color("BackgroundDark").edgesIgnoringSafeArea(.all)
//            
//            VStack(spacing: 0) { // Spacing 0 to allow custom padding control
//                
//                // 🚨 FIX 1: Custom Header (Title and Thin Line)
//                CustomTitleView()
//                
//                // Content Stack
//                VStack(spacing: 10) {
//                    
//                    // FIX 2: Reduce Image Size to match proportions
//                    Image("HappyPlant")
//                        .resizable().scaledToFit().frame(width: 250, height: 250) // Smaller image
//                    
//                    Spacer().frame(height: 5) // Small separator space
//                    
//                    // FIX 3: Reduce Title Font Size
//                    Text("Start your plant journey!")
//                        .font(.title2) // Reduced from .largeTitle
//                        .fontWeight(.bold).foregroundColor(.white)
//                    
//                    // Subtitle Text Block
//                    HStack(spacing: 0) { // Use an HStack to avoid wide multiline centering issues
//                        Text("Now all your plants will be in one place and we will help you take care of them :)")
//                            .font(.subheadline) // Smaller font size
//                            .foregroundColor(.gray)
//                            .multilineTextAlignment(.center)
//                        
//                        // Custom Plant Icon at the end
//                        Image("SmallPottedPlant")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 15, height: 16)
//                            .baselineOffset(-2.0)
//                    }
//                    .padding(.horizontal, 60) // Tighter padding for text block
//                    
//                    Spacer() // Pushes content up
//                    
//                    // Button remains the same
//                    Button { showingSetReminderSheet = true } label: {
//                        Text("Set Plant Reminder").font(.headline).fontWeight(.semibold).foregroundColor(.white)
//                            .padding().frame(maxWidth: .infinity).background(Color("AccentTeal")).cornerRadius(26)
//                    }
//                    .padding(.horizontal, 30).padding(.bottom, 140)
//                }
//                .padding(.top, 100) // Push content down slightly below the header
//            }
//        }
//        .sheet(isPresented: $showingSetReminderSheet) {
//            SetReminderView(viewModel: viewModel)
//        }
//    }
//}


//third
//import SwiftUI
//
//struct EmptyStateView: View {
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
//                VStack(spacing: 20) {
//                    
//                    Image("HappyPlant")
//                        .resizable().scaledToFit().frame(width: 250, height: 250)
//                    
//                    Spacer().frame(height: 5)
//                    
//                    Text("Start your plant journey!")
//                        .font(.title2).fontWeight(.bold).foregroundColor(.white)
//                    padding(.top,30)
//                    
//                    VStack(spacing: 8) {
//                        Text("Now all your plants will be in one place and we will help you take care of them :) 🪴 ")
//                            .font(.subheadline).foregroundColor(.gray)
//                            .padding(.horizontal, 30).padding(.top, 5)
//                            .multilineTextAlignment(.center)
//                        
//                        HStack(alignment: .lastTextBaseline, spacing: 3) {
//                            Text("").foregroundColor(.gray)
////                            Image("SmallPottedPlant")
////                                .resizable().scaledToFit().frame(width: 15, height: 15)
////                                .baselineOffset(-2.0)
//                        }
//                    }
//                    .padding(.horizontal, 60)
//                    
//                    Spacer()
//                    
//                    Button { showingSetReminderSheet = true } label: {
//                        Text("Set Plant Reminder").font(.headline).fontWeight(.semibold).foregroundColor(.white)
//                            .padding().frame(maxWidth: .infinity).background(Color("AccentTeal")).cornerRadius(26)
//                    }
//                    .padding(.horizontal, 30).padding(.bottom, 40)
//                }
//                .padding(.top, 40)
//            }
//        }
//        .sheet(isPresented: $showingSetReminderSheet) {
//            SetReminderView(viewModel: viewModel)
//        }
//    }
//}





import SwiftUI

struct EmptyStateView: View {
    var onTap: () -> Void
    
    var body: some View {
        ZStack {
            
            VStack(spacing: 22) {
                Spacer(minLength: 24)
                
                
                VStack(spacing: 20) {
                    // 👉 Exact illustration
                    Image("HappyPlant")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                    
         
                    
                    
                    VStack(spacing: 8) {
                    Text("Start your plant journey!")
                        .font(.system(size: 26, weight: .bold,))
                        .foregroundStyle(.white)
                        .padding(.top, 2)
                    
//                        Spacer()
                    
                        Text("Now all your plants will be in one place and\nwe will help you take care of them :) 🪴")
                            .font(.system(size: 15))
                            .foregroundStyle(.white.opacity(0.7))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 32)
                    }}
                
                Spacer()

                Button(action: onTap) {
                    // 👉 White label, not blue
                    Text("Set Plant Reminder")
                        .foregroundStyle(.white)
                        .font(.system(size: 17, weight: .semibold))
                        .frame(width: 300, height: 20)                        .padding(.vertical, 13)


                }
                .background(AccentTeal)
                .clipShape(Capsule())
                .shadow(color: AccentTeal.opacity(0.35), radius: 10, x: 0, y: 6)
                .padding(.top, 40)
                .padding(.horizontal, 30)
                .padding(.bottom, 40)
                
                Spacer(minLength: 50)
            }
            .background(BackgroundDark.ignoresSafeArea())
        }
    }
}
#Preview {
    ContentView()
}

