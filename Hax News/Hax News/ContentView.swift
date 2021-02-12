//
//  ContentView.swift
//  Hax News
//
//  Created by Kieran O'Donnell on 12/02/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List{
            Text("Hello, World!")
            Text("eread, World!")
            Text("Hello, Worefdwdfwld!")
                }
            .navigationBarTitle("Hax News")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
