//
//  LoginViewViewModel.swift
//  ToDo
//
//  Created by Nathan Holmquist on 3/13/25.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        
        // Try Login
        
        Auth.auth().signIn(withEmail: email, password: password)
        
        
    }
    
    private func validate() -> Bool {
        
        errorMessage = "" // Reset errorMessage
        
        guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            
            errorMessage = "Please fill in all fields."
            
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            
            errorMessage = "Please enter a valid email"
            
            return false
        }
        
        return true // If all cases pass
    }
}

