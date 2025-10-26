//
//  CustomHeaderView.swift
//  Plant
//
//  Created by Wteen Alghamdy on 01/05/1447 AH.
//

//first
//  CustomHeaderView.swift
//  Plant
//
//  Created by Wteen Alghamdy on 30/04/1447 AH.
//
//import SwiftUI
//
//struct CustomHeaderView: View {
//
//    let title: String
//    let dismissAction: () -> Void
//
//    var body: some View {
//        HStack {
//            Button { dismissAction() } label: {
//                Image(systemName: "xmark").font(.title2).foregroundColor(.white)
//            }
//            .padding(.leading, 15)
//
//            Spacer()
//
//            Text(title).font(.headline).fontWeight(.bold).foregroundColor(.white)
//
//            Spacer()
//
//            Button(action: {}) {
//                Image(systemName: "xmark").font(.title2).foregroundColor(.clear)
//            }
//            .padding(.trailing, 15)
//        }
//        .padding(.top, 20)
//        .background(Color("BackgroundDark"))
//    }
//}


//second
//import SwiftUI
//
//struct CustomHeaderView: View {
//
//    let title: String
//    let dismissAction: () -> Void // For the 'X' button
//    let saveAction: () -> Void    // For the 'Checkmark' button
//
//    var body: some View {
//        HStack {
//            // 1. Dismiss Button (Left Side - 'X')
//            Button {
//                dismissAction()
//            } label: {
//                Image(systemName: "xmark")
//                    .font(.title2)
//                    .foregroundColor(.gray) // Gray color for subtle look
//            }
//            .padding(.leading, 15)
//
//            Spacer()
//
//            // 2. Centered Title
//            Text(title)
//                .font(.headline)
//                .fontWeight(.bold)
//                .foregroundColor(.white)
//
//            Spacer()
//
//            // 3. Save Button (Right Side - Checkmark)
//            Button {
//                saveAction()
//            } label: {
//                // Use a checkmark SF Symbol, or a custom asset if you have one named "SaveCheck"
//                Image(systemName: "checkmark.circle.fill")
//                    .font(.title) // Slightly larger font size
//                    .foregroundColor(Color("AccentTeal")) // Teal accent color
//            }
//            .padding(.trailing, 15)
//        }
//        .padding(.top, 20)
//        .padding(.bottom, 10)
//        .background(Color("InputBackground"))
//    }
//}




import SwiftUI

struct CustomHeaderView: View {
    let title: String
    
    private var hairline: CGFloat { 1.0 / UIScreen.main.scale }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(title)
                    .font(.system(size: 34, weight: .bold,))
                    .foregroundStyle(.white)
                    .lineLimit(1)
                                    Spacer(minLength: 0)
            }
            .padding(.top, 8)
            .padding(.horizontal, 22)
            .padding(.bottom, 12)

            Rectangle()
                .fill(.gray.opacity(1))   // hairline divider
                .frame(height: hairline)
                .ignoresSafeArea(edges: .horizontal)
        }
        .background(BackgroundDark)
    }
}
