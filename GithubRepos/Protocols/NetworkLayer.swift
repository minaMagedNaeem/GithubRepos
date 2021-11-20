//
//  NetworkLayer.swift
//  GithubRepos
//
//  Created by Mina Maged on 11/19/21.
//

import Foundation

protocol NetworkLayer {
    func getRepos<T: Codable>(completion: @escaping ((_ success: Bool, _ repos: T?) -> Void))
    
    func getRepo<T: Codable>(url: String, completion: @escaping ((_ success: Bool, _ repo: T?) -> Void)) 
}
