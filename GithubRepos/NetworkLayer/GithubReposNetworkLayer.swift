//
//  GithubReposNetworkLayer.swift
//  GithubRepos
//
//  Created by Mina Maged on 11/19/21.
//

import Foundation

class GithubReposNetworkLayer : NetworkLayer {
    
    let baseURL = "https://api.github.com"
    
    func getRepos<T: Codable>(completion: @escaping ((_ success: Bool, _ repos: T?) -> Void)) {
        let url = URL(string: "\(baseURL)/repositories")!

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data, error == nil else {
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
