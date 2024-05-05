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
                //signed In
                ToDoListView()
            }else{
                LoginView()
            }
        }
    }
}

#Preview {
    MainView()
}
