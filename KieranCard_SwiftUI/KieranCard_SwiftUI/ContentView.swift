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
            Text("Kieran O'Donnell")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
