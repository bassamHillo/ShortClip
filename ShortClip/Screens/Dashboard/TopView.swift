//
//  TopView.swift
//  ShortClip
//
//  Created by Bassam Hillo on 03/04/2025.
//

import SwiftUI

struct TopView: View {
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Image(.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                Spacer()
            }

            HStack {
                getFilterButton(text: "Movie")
                getFilterButton(text: "Shows")
                getFilterButton(text: "Categories", icon: "chevron.down")
                Spacer()
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 5)
    }

    private func getFilterButton(
        text: String,
        icon: String? = nil
    ) -> some View {
        Button {
            // Handle button action
        } label: {
            HStack(spacing: 5) {
                Text(text)
                    .font(.system(size: 14))

                if let icon = icon {
                    Image(systemName: icon)
                        .font(.system(size: 10, weight: .semibold))
                }
            }
            .foregroundColor(.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.white, lineWidth: 1)
            )
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TopView()
        .background(.black)
}
