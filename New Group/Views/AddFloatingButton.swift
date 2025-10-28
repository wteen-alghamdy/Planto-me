//
//  AddFloatingButton.swift
//  Planto
//
//  Created by Wteen Alghamdy on 04/05/1447 AH.
//
import SwiftUI

struct AddFloatingButton: View {
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .fill(AccentTeal)
                    .frame(width: 60, height: 60)
                    .shadow(color: AccentTeal.opacity(0.45), radius: 14, x: 0, y: 8)
                Image(systemName: "plus")
                    .font(.system(size: 26, weight: .bold))
                    .foregroundStyle(.white)
//                    .glassEffect(.clear)
            }
        }
        .padding(.trailing, 22)
        .padding(.bottom, 26)
    }
}
