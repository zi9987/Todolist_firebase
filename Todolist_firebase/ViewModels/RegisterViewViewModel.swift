//
//  RegisterViewViewModel.swift
//  Todolist_firebase
//
//  Created by 羅子淵 on 2024/5/5.
//
import FirebaseAuth
import Foundation
import FirebaseFirestore
class ResigisterViewModel:ObservableObject{
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    
    init(){}
    
    func register(){
        guard validate()  else{
            return
        }
        // 不太懂weak self 的意思
        Auth.auth().createUser(withEmail: email, password: password){[weak self]result, error in
            guard let userId = result?.user.uid else{
                return
            }
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id:String){
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db=Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool{
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        guard email.contains("@") && email.contains(".") else{
            return false
        }
        guard password.count >= 6 else{
            return false // password
        }
        return true
    }
}
