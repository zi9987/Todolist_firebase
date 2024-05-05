//
//  TLButton.swift
//  Todolist_firebase
//
//  Created by 羅子淵 on 2024/5/5.
//

import SwiftUI

struct TLButton: View {
    let title:String
    let background:Color
    let action:()->Void
    var body: some View {
        Button{
           action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
                
            }
        }
       
    }
}

#Preview {
    TLButton(title: "value", background: .pink){
        //Action
    }
}
