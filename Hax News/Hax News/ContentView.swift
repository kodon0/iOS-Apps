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

struct Post: Identifiable {
    let id: String
    let title: String
}

let posts = [
    Post(id: "1", title: "first post")
    Post(id: "2", title: "second post")
    Post(id: "3", title: "third post")
]
