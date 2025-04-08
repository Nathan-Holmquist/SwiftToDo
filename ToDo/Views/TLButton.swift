//
//  TLButton.swift
//  ToDo
//
//  Created by Nathan Holmquist on 4/7/25.
//

import SwiftUI

struct TLButton: View {
    
    let title: String
    let background: Color
    let action: () -> Void
    
    
    var body: some View {
        
        
        Button{
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TLButton(title: "Title",
             background: .blue) {
            // Action
    }
}
