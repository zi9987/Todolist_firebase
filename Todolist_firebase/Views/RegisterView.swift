//
//  RegisterView.swift
//  Todolist_firebase
//
//  Created by 羅子淵 on 2024/5/5.
//

import SwiftUI

struct RegisterView: View {
   @StateObject var viewModel = ResigisterViewModel()
    var body: some View {
        VStack{
            //Header
            HeaderView(title: "Register", subtile: "Start Organize to do", angle: -15, background: .orange)
            
            Form{
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password(>6 charcacter)", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                TLButton(title: "Create Account", background: .green){
                    //Action registration
                    viewModel.register()
                }
                .padding()
            }
           
            
            .offset(y:-100)
        }
        
    }
}

#Preview {
    RegisterView()
}
