//
//  PostData.swift
//  HNReader
//
//  Created by Богдан Беннер on 19.02.2022.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let title: String
    let points: Int
    let url: String?
    let objectID:  String
}
