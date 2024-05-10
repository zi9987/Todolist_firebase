//
//  MainViewViewModel.swift
//  Todolist_firebase
//
//  Created by 羅子淵 on 2024/5/5.
//
import FirebaseAuth
import Foundation
import UserNotifications
class MainViewViewModel:ObservableObject{
    @Published var currentUserId:String = ""
    private var handler:AuthStateDidChangeListenerHandle?
    
    init(){
        self.handler = Auth.auth().addStateDidChangeListener {[weak self]_, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
        public var isSignedIn:Bool{
            return Auth.auth().currentUser != nil
        }
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                print("Notification permission granted.")
            } else if let error = error {
                print("Notification permission error: \(error)")
            }
        }
    }
    
}
