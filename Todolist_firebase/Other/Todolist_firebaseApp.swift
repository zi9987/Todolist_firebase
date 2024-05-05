//
//  Todolist_firebaseApp.swift
//  Todolist_firebase
//
//  Created by 羅子淵 on 2024/5/5.
//
import FirebaseCore
import SwiftUI

@main
struct Todolist_firebaseApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
