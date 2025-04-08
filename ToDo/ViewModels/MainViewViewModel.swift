//
//  MainViewViewModel.swift
//  ToDo
//
//  Created by Nathan Holmquist on 3/13/25.
//

import FirebaseAuth
import Foundation


class MainViewViewModel: ObservableObject {
    
    @Published var currentUserID: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            self?.currentUserID = user?.uid ?? ""
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
