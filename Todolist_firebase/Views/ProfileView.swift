//
//  ProfileView.swift
//  Todolist_firebase
//
//  Created by 羅子淵 on 2024/5/5.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel(userId: "")
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user{
                    profile(user:user)
                } else{
                    Text("Loading Profile ...")
                }
            }
            //Sign out
            
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
    @ViewBuilder
    func profile(user:User) -> some View{
        //Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125,height: 125)
            .padding()
        //Info
        VStack(alignment: .leading){
            HStack{
                Text("Name:")
                    .bold()
                Text(user.name)
                
            }
            .padding()
            HStack{
                Text("Email:")
                    .bold()
                Text(user.email)
                
            }
            .padding()
            HStack{
                Text("Member since:")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                
            }
            .padding()
        }
        .padding()
        Button("log Out"){
            viewModel.logOut()
        }
        .tint(.red)
        .padding()
        Spacer()
        Button("Delete Account") {
            showingAlert = true
        }
        .padding()
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text("Confirm Account Deletion"),
                message: Text("Are you sure you want to delete your account? This action cannot be undone."),
                primaryButton: .destructive(Text("Delete")) {
                    viewModel.deleteUserAccount()
                },
                secondaryButton: .cancel()
            )
        }
    }
}
    #Preview {
        ProfileView()
    }

