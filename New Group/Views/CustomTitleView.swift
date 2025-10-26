//
//  CustomTitleView.swift
//  Plant
//
//  Created by Wteen Alghamdy on 01/05/1447 AH.
//


//import SwiftUI
//
//struct CustomTitleView: View {
//    var body: some View {
//        VStack(spacing: 0) {
//            
//            HStack {
//                // The Title Text with the Image
//                (Text("My Plants ")
//                    .font(.title) // Size that matches the design
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//                 +
//                 Text("🌱") // The small sprout icon
//                )
//                .padding(.leading, 20) // Spacing from the left edge
//                
//                Spacer()
//            }
//            .frame(height: 50) // Fixes the height of the title area
//            
//            // 🚨 FIX: The thin gray separator line
//            Rectangle()
//                .fill(Color.gray.opacity(0.5)) // Thin grey color
//                .frame(height: 1) // Very thin line
//        }
//        .background(Color("BackgroundDark").edgesIgnoringSafeArea(.top)) // Ensures background is dark
//        .padding(.bottom, 10) // Small space between line and content
//        .padding(.top, 20)
//    }
//}


//import SwiftUI
//
//struct CustomTitleView: View {
//    var body: some View {
//        VStack(spacing: 0) {
//            
//            HStack {
//                // The Title Text with the Image
//                (Text("My Plants ")
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//                 +
//                 Text("🌱")
//                )
//                .padding(.leading, 20)
//                
//                Spacer()
//            }
//            .frame(height: 50)
//            
//            // The thin gray separator line
//            Rectangle()
//                .fill(Color.gray.opacity(0.5))
//                .frame(height: 1)
//        }
//        .background(Color("BackgroundDark").edgesIgnoringSafeArea(.top))
//        .padding(.bottom, 5)
//    }
//}







// (Optional helper if you want a reusable title style elsewhere)
import SwiftUI
struct CustomTitleView: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.system(size: 28, weight: .bold, design: .rounded))
            .foregroundStyle(.white)
    }
}
