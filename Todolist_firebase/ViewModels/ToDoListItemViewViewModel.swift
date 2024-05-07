//
//  ToDoListItemViewViewModel.swift
//  Todolist_firebase
//
//  Created by 羅子淵 on 2024/5/5.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation


//ViewModels for single todolist item view(each row in item list)
class ToDoListItemViewViewModel:ObservableObject{
    init(){
        
    }
    func toggleIsDone(item: ToDoLIstItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        
        guard let uid = Auth.auth().currentUser? .uid else{
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
