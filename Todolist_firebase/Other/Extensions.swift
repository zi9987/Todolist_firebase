//
//  Extensions.swift
//  Todolist_firebase
//
//  Created by 羅子淵 on 2024/5/6.
//

import Foundation

extension Encodable{
    func asDictionary()->[String: Any]{
        guard let data = try? JSONEncoder().encode(self) else{
            return[:]
        }
        do{
            let json = try JSONSerialization.jsonObject(with: data) as? [String:Any]
            return json ?? [:]
        }catch{
            return[:]
        }
    }
}
