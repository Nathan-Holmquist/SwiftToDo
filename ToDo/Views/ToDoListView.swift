//
//  ToDoListItemView.swift
//  ToDo
//
//  Created by Nathan Holmquist on 3/13/25.
//

import SwiftUI
import FirebaseFirestore

struct ToDoListView: View {
    
    @StateObject var viewModel = ToDoListViewViewModel()
    @FirestoreQuery var items: [ToDoListItem]
    
    
    init(userId: String) {
        self._items = FirestoreQuery(
            collectionPath:"users/\(userId)/todos"
        )
        
        print(userId)
        
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items){ item in
                    ToDoListItemsView(item: item)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    // Add Item
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName:"plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "JDLuiQMO29VDbVB6iwRKOTO0h3y2")
}
