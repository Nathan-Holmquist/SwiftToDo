//
//  ProfileViewViewModel.swift
//  ToDo
//
//  Created by Nathan Holmquist on 3/13/25.
//

import Foundation
import FirebaseAuth

class ProfileViewViewModel: ObservableObject {
    
    @Published var currentUserID: String = ""
    
    init() {}
     
    public func signOut() {
        
        do {
            try Auth.auth().signOut()
            currentUserID = ""
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
        
    }
}
