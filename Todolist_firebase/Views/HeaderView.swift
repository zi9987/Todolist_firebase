//
//  HeaderView.swift
//  Todolist_firebase
//
//  Created by 羅子淵 on 2024/5/5.
//

import SwiftUI

struct HeaderView: View {
    let title:String
    let subtile:String
    let angle:Double
    let background:Color
    var body: some View {
        VStack{
            //Header
            ZStack{
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(background)
                    .rotationEffect(Angle.degrees(angle))
                    
                VStack{
                    Text(title)
                        .font(.system(size: 50))
                        .foregroundColor(Color.white)
                        .bold()
                    Text(subtile)
                        .font(.system(size: 30))
                        .foregroundColor(Color.white)
                }
                .padding(.top,80)
            }
            .offset(y:-150)
            .frame(width: UIScreen.main.bounds.width*3,height: 350)
            
            Spacer()
        }
    }
}

#Preview {
    HeaderView(title: "Title", subtile: "Subtitle", angle: 15, background: .blue)
}
