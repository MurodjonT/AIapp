//
//  SignUpButton.swift
//  AIapp
//
//  Created by Murodjon Turobov on 11/06/25.
//
import SwiftUI

struct SignUpButton: View {
    var titleKey: LocalizedStringKey
    var image: String?
    var action: () -> Void
    
    init(_ titleKey: LocalizedStringKey, _ image: String? = nil, action: @escaping () -> Void) {
        self.titleKey = titleKey
        self.action = action
        self.image = image
    }
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Text(titleKey)
                Image(image ?? "")
                    
 
            }
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity)
            
            
        }

        .foregroundStyle(Color.black)
        .clipShape(.rect(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(.systemGray4), lineWidth: 1)
            )
    }
}
