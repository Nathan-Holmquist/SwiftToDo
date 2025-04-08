//
//  RegisterView.swift
//  ToDo
//
//  Created by Nathan Holmquist on 3/13/25.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        
        VStack{
            
            HeaderView(title: "Register",
                       subtitle: "Start organizing todo's",
                       angle: -15,
                       background: Color.orange)
            
            Form{
                
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                }
            
                
                TextField("Full Name", text: $viewModel.fullName)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    
                
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)  
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Create Account",
                         background: .green
                ){
                    // Attempt Registration
                    viewModel.register()
                    print("YER")
                }
            }
        }
        Spacer()
    }
}

#Preview {
    RegisterView()
}
