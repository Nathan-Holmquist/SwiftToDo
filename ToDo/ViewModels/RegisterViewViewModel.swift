//
//  LoginViewViewModel.swift
//  ToDo
//
//  Created by Nathan Holmquist on 3/13/25.
//

import FirebaseFirestore
import Foundation
import FirebaseAuth

class RegisterViewViewModel: ObservableObject {
    
    @Published var fullName = ""
    @Published var email = ""
    @Published var password = ""
    
    @Published var errorMessage = ""
    
    
    init() {}
    
    func register() {
        guard validate() else {
            return
        }
        
        // Try Login
        Auth.auth().createUser(withEmail: email, password: password){ [weak self] result, error in
            guard let userID = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userID)
        }
        
        
    }
    
    
    private func insertUserRecord(id: String) {
        
        let newUser = User(id: id,
                           name: fullName,
                        email: email,
                        joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    
    private func validate() -> Bool {
        
        errorMessage = "" // Reset errorMessage
        
        
        guard fullName.contains(" ") else {
            
            errorMessage = "Please enter both your first and last name"
            
            return false
        }
        
        guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !fullName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            
            errorMessage = "Please fill in all fields."
            
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            
            errorMessage = "Please enter a valid email."
            
            return false
        }
        
        guard password.count >= 6 else {
            
            errorMessage = "Password length must be greater than 6."
            
            return false
        }
        
        return true // If all cases pass
    }
}

