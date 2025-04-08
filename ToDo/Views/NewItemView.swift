//
//  NewItem.swift
//  ToDo
//
//  Created by Nathan Holmquist on 3/13/25.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size:32))
                .bold()
                .padding(.top, 100)
            
            Form {
                // Title
                TextField("Name or title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                // Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // Button
                TLButton(
                    title: "Add Item",
                    background: .pink
                ){
                    if viewModel.canSave() {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
        } .alert(isPresented: $viewModel.showAlert){
            Alert(title: Text("Error"), message: Text("Please fill in all fields and select due date today or newer."))
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
    }))
}
