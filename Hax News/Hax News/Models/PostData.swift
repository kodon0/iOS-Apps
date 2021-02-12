//
//  PostData.swift
//  Hax News
//
//  Created by Kieran O'Donnell on 12/02/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import Foundation
struct Results:Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
//        Using computed property
    var id: String {
        return objectID
    }
    let objectID: String
    let title: String
    let points: Int
    let url: String
}
