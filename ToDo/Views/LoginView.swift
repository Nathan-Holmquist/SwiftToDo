//
//  LoginView.swift
//  ToDo
//
//  Created by Nathan Holmquist on 3/13/25.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                // Header
                HeaderView(title: "To Do List",
                           subtitle: "Get Things Done",
                           angle: 15,
                           background: Color.pink)
                
                
                Form {
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    
                    TextField("Email address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text:$viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TLButton(title: "Login",
                             background: .blue
                    ){
                        viewModel.login()
                    }
                    .padding()
                    
                }
                .offset(y:-50)
                
                VStack{
                    Text("New around here?")
                    
                    NavigationLink("Create an account", destination: RegisterView())
                    
                }
                .padding(.bottom, 50)
            }
        }
    }
}

#Preview {
    LoginView()
}
