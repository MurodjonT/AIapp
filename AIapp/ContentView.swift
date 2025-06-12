//
//  ContentView.swift
//  AIapp
//
//  Created by Murodjon Turobov on 11/06/25.
//

import SwiftUI



struct ContentView: View {
    @State private var email = ""
     @State private var password = ""
     @State private var isSecured = true
    var body: some View {
        
        ScrollView {
            VStack {
                Image("CPU 3")
                    .frame(width: 75, height: 75)
                    .padding(.top, 55)
                Text("  IMAGINE \nWITH AIKO")
                    .font(.system(size: 50))
                
             
                CustomTextField(
                        title: "Email address",
                        text: $email,
                        keyboardType: .emailAddress
                    )
                
                CustomTextField(
                        title: "Password",
                        text: $password,
                        keyboardType: .default
                    )
                    .padding(.top, 20)
                
                HStack {
                    Spacer()
                    Button(action: {
                    
                    }) {
                        Text("Forgot Password?")
                            .font(.footnote)
                            .foregroundColor(.black)
                    }
                }
                .padding(.top, 10)
                
                MainButton("Create") {
                }
                .padding(.top)
                
                Divider()
                    .padding([.top, .bottom], 20)
                    
                
                SignUpButton("Sign up with Google") {
                }
                
                
            }
            .padding(EdgeInsets(top: 10, leading: 30, bottom: 0, trailing: 30))
        }
    }
}

#Preview {
    ContentView()
}



struct SignUpButton: View {
    var titleKey: LocalizedStringKey
    var action: () -> Void
    
    init(_ titleKey: LocalizedStringKey, action: @escaping () -> Void) {
        self.titleKey = titleKey
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Text(titleKey)
                Image(systemName: "Google Logo")
 
            }
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
            
        }
        .buttonStyle(.borderedProminent)
        .foregroundStyle(Color.white)
        .clipShape(.rect(cornerRadius: 12))
    }
}
