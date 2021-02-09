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
                
                
                Image(/*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Image Name@*/"Image Name"/*@END_MENU_TOKEN@*/)
                Text("Kieran O'Donnell")
                    .font(Font.custom("Ubuntu-Medium", size: 30))
                    .bold()
                    .foregroundColor(.white)
                Text("iOS Developer, Data Scientist")
                    .foregroundColor(.white)
                    .font(Font.custom("Ubuntu-Medium", size: 15))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
