//
//  ToDoLIstItem.swift
//  Todolist_firebase
//
//  Created by 羅子淵 on 2024/5/5.
//

import Foundation

struct ToDoLIstItem:Codable, Identifiable{
    let id:String
    let title:String
    let dueDate:TimeInterval
    let createdDate:TimeInterval
    var isDone:Bool
    
    
    
    mutating func setDone(_ state: Bool){
        isDone = state
    }
}
