//
//  ProfileView.swift
//  ToDo
//
//  Created by Nathan Holmquist on 3/13/25.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        
        NavigationView{
            VStack{
                TLButton(title: "Sign out", background: .pink){
                    // Action
                    viewModel.signOut()
                }
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
