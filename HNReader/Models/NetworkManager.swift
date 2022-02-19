//
//  NetworkManager.swift
//  HNReader
//
//  Created by Богдан Беннер on 19.02.2022.
//

import Foundation
import SwiftUI

class NetworkManager: ObservableObject {
   @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { Data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = Data {
                        do {
                        let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                            
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
