//
//  ToDoListViewViewModel.swift
//  Todolist_firebase
//
//  Created by 羅子淵 on 2024/5/5.
//
import FirebaseFirestore
import Foundation




//ViewModels for list of items view
//Primary Tab
class ToDoListViewViewModel:ObservableObject{
    
    @Published var showingNewItemView = false
    
    private let userId:String
    
    init(userId:String){
        self.userId = userId
    }
    /// Delete TodoList Item
    func delete(id:String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
    
   
}
