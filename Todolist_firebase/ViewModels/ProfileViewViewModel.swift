//
//  ProfileViewViewModel.swift
//  Todolist_firebase
//
//  Created by 羅子淵 on 2024/5/5.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class ProfileViewViewModel:ObservableObject{
    
    private let userId:String
    init(userId: String, user: User? = nil) {
        self.userId = userId
        self.user = user
    }
   
    @Published var user:User? = nil
    func fetchUser(){
        guard let userId = Auth.auth().currentUser?.uid else{
            return
        }
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument {[weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else{
                return
            }
            DispatchQueue.main.async {
                self?.user = User(id: data["id"] as? String ?? "",
                                  name: data["name"] as? String ?? "",
                                  email: data["email"] as? String ?? "",
                                  joined: data["joined"] as? TimeInterval ?? 0)
            }
        }
    }
    func logOut(){
        do {
            try Auth.auth().signOut()
        } catch  {
            print(error)
        }
        
    }
    func deleteUserAccount() {
        let user = Auth.auth().currentUser

        user?.delete { error in
            if let error = error {
                // Handle the error if deletion fails
                print("Error deleting account: \(error.localizedDescription)")
            } else {
                // Handle the successful deletion, maybe navigate to a login screen
                print("Account successfully deleted")
            }
        }
    }
}
