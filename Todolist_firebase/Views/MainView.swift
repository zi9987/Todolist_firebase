//
//  ContentView.swift
//  Todolist_firebase
//
//  Created by 羅子淵 on 2024/5/5.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        
        NavigationView{
            if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
               accountView
               
            }else{
                LoginView()
            }
        }
       
    }
    @ViewBuilder
    var accountView: some View{
        TabView{
            ToDoListView(userId:viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
    
}

#Preview {
    MainView()
}
