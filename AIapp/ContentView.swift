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
    @State private var angle: Angle = .zero
    
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 60)
                .strokeBorder(
                    AngularGradient(
                        colors: [.red, .orange, .yellow, .green, .blue, .purple],
                        center: .center,
                        angle: angle
                    ),
                    
                    lineWidth: 7
                    
                )
                .blur(radius: 5)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                .padding(0)
                .onAppear {
                    withAnimation(.linear(duration: 8).repeatForever(autoreverses: false)) {
                        angle = .degrees(360)
                    }
                }
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
//                    .disabled(email.isEmpty || password.isEmpty)
                    .padding(.top)
                    
                    Divider()
                        .padding([.top, .bottom], 20)
                    
                    
                    SignUpButton("Sign up with Google", "Google Logo") {
                        
                    }
                    
                    SignUpButton("Sign up with Apple", "Apple  Logo") {
                        
                    }
                    .padding(.top, 20)
                    
                    HStack(spacing: 40) {
                        Button(action: {
                            
                        }) {
                            Text("Privacy Policy")
                                .font(.footnote)
                                .foregroundColor(.black)
                        }
                        
                        Button(action: {
                            
                        }) {
                            Text("Terms of Service")
                                .font(.footnote)
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.top, 20)
                    
                }
                .padding(.horizontal, 30)
            }
            
        }
        .ignoresSafeArea()
        
        
    }
        
}
//#Preview {
//    ContentView()
//}


