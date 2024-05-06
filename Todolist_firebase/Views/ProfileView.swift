//
//  ProfileView.swift
//  Todolist_firebase
//
//  Created by 羅子淵 on 2024/5/5.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
   
    var body: some View {
        NavigationView{
            VStack{
                
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
