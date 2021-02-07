//
//  ContentView.swift
//  SwiftUI Test
//
//  Created by Kieran O'Donnell on 08/02/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Color(.systemIndigo).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Text("SwiftUI is super cool!")
                .font(.system(size: 50))
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(Color.orange)
                    .multilineTextAlignment(.center)
                Image("swiftui").resizable().aspectRatio(contentMode: .fit).frame(width: 200, height: 200, alignment: .center)
            } }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
