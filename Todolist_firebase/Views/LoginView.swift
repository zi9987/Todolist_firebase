//
//  LoginView.swift
//  Todolist_firebase
//
//  Created by 羅子淵 on 2024/5/5.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""

    
    var body: some View {
        NavigationView{
            VStack{
                //Header
                HeaderView(title: "To Do List", subtile: "Get Things Done", angle: 15, background: .pink)
                //Form
                Form{
                    TextField("Email Address",text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    SecureField("Password",text: $password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    Button{
                        //Attem Login
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.blue)
                            
                            Text("Login")
                                .foregroundColor(Color.white)
                                .bold()
                            
                        }
                    }
                }
                .offset(y:-50)
                //Ceate Account
                VStack{
                    Text("New Around Here?")
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
