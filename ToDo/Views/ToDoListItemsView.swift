//
//  ToDoListItemsView.swift
//  ToDo
//
//  Created by Nathan Holmquist on 3/13/25.
//

import SwiftUI

struct ToDoListItemsView: View {
    let item: ToDoListItem
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.title)
                    .bold()
                Text("\(Date(timeIntervalSince1970:item.dueDate).formatted(date: .abbreviated,time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            }
        }
    }
}

#Preview {
    ToDoListItemsView(item: .init(id: "123",
                                  title: "get milk",
                                  dueDate: Date().timeIntervalSince1970,
                                  createdDate: Date().timeIntervalSince1970,
                                  isDone: true))
}
