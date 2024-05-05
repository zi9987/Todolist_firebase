//
//  LoginViewViewModel.swift
//  Todolist_firebase
//
//  Created by 羅子淵 on 2024/5/5.
//
import FirebaseAuth
import Foundation

class LoginViewViewModel:ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    
    init(){}
    
    func login(){
        guard validate() else{
            return
        }
        // Try to log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    private func validate() -> Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces) .isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            
            errorMessage="please fill in all fields"
            return false
        }
        // email@ .com
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Please enter valid email."
            return false
        }
       return true
        
    }
}
