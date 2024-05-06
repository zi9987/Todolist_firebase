//
//  ToDoListItemView.swift
//  Todolist_firebase
//
//  Created by 羅子淵 on 2024/5/5.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let item:ToDoLIstItem
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.body)
                    
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
                
            }
            Spacer()
            
            Button{
                viewModel.toggleIsDone(item: item)
            }label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill":"circle")
            }
        }
    }
}

#Preview {
    ToDoListItemView(item: .init(id: "123",
                                 title: "Get Milk", 
                                 dueDate: Date().timeIntervalSince1970,
                                 createdDate: Date().timeIntervalSince1970,
                                 isDone: true))
}
