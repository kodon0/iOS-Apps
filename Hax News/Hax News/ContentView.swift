//
//  ContentView.swift
//  Hax News
//
//  Created by Kieran O'Donnell on 12/02/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
//    Note  difference between Observed and Observable!
    @ ObservedObject var networkManager = NetworkManager()

    var body: some View {
        NavigationView {
            List(networkManager.posts, rowContent: { (post) -> Text in
            Text(post.title)
            })
            .navigationBarTitle("Hax News")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//let posts = [
//    Post(id: "1", title: "yabadabadoo post"),
//    Post(id: "2", title: "second post"),
//    Post(id: "3", title: "third post"),
//]
