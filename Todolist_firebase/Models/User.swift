//
//  User.swift
//  Todolist_firebase
//
//  Created by 羅子淵 on 2024/5/5.
//

import Foundation

struct User:Codable{
    let id:String
    let name:String
    let email:String
    let joined:TimeInterval
}
