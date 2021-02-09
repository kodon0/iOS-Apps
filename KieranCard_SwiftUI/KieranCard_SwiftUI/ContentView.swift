//
//  ContentView.swift
//  KieranCard_SwiftUI
//
//  Created by Kieran O'Donnell on 09/02/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(UIColor(red: 0.88, green: 0.44, blue: 0.33, alpha: 0.9))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                
                
                Image("2150BB22-68E2-4A96-9B4A-1A27750C89BC_1_201_a").resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150.0, height: 240.0)
                    .clipShape(Rectangle())
                    .overlay(Rectangle().stroke(Color.white, lineWidth: 5))
                Text("Kieran O'D")
                    .font(Font.custom("Ubuntu-Medium", size: 30))
                    .bold()
                    .foregroundColor(.white)
                Text("iOS Developer, Data Scientist")
                    .foregroundColor(.white)
                    .font(Font.custom("Ubuntu-Medium", size: 15))
                Divider()
                InfoView(text: "+123 456 789")
                Image(systemName: "phone.down.circle")
                .foregroundColor(.white)
                InfoView(text: "email@email.com")
                Image(systemName: "envelope")
                .foregroundColor(.white)
            }
                    
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct InfoView: View {
    
    let text: String
    var body: some View {
        RoundedRectangle(cornerRadius: 35)
            .frame(height: 35)
            .foregroundColor(.white)
            .overlay(Text(text).font(Font.custom("Ubuntu-Medium", size: 20)))
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}
