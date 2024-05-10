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
    func scheduleNotification(for item: ToDoLIstItem) {
        let reminderDate = Date(timeIntervalSince1970: item.dueDate)

        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.body = "Don't forget: \(item.title)"
        content.sound = UNNotificationSound.default

        let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: reminderDate)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)

        let request = UNNotificationRequest(identifier: item.id, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error)")
            }
        }
    }


}
