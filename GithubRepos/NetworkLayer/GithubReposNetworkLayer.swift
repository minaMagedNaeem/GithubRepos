//
//  GithubReposNetworkLayer.swift
//  GithubRepos
//
//  Created by Mina Maged on 11/19/21.
//

import Foundation

class GithubReposNetworkLayer : NetworkLayer {
    
    let baseURL = "https://api.github.com"
    
    func getRepos<T: Decodable>(completion: ((_ success: Bool, _ repos: T?) -> Void)) {
        let url = URL(string: "\(baseURL)/repositories")!

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                DispatchQueue.main.async {
                    completion(false, nil)
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(false, nil)
                }
                return
            }
            
            let decodedValue = try? JSONDecoder().decode(T.self, from: data)
            
            DispatchQueue.main.async {
                completion(true, decodedValue)
            }
            
        }
        task.resume()
    }
}
