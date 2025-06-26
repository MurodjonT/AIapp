//
//  CustomTextfield.swift
//  AIapp
//
//  Created by Murodjon Turobov on 11/06/25.
//
import SwiftUI

struct CustomTextField: View {
    
    let title: LocalizedStringKey
    @Binding var text: String
 
    init(_ title: LocalizedStringKey, text: Binding<String>) {
        self.title = title
        _text = text
    }
    
    var body: some View {
            TextField(title, text: $text)
                .autocorrectionDisabled(true)
                .autocapitalization(.none)
                .padding(12)
                .background {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.background)
                        .stroke(.separator)
                }
        }
    }



