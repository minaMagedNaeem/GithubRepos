//
//  NetworkLayer.swift
//  GithubRepos
//
//  Created by Mina Maged on 11/19/21.
//

import Foundation

protocol NetworkLayer {
    
    func getRepos(completion: ((_ success: Bool, _ repos: [Repo]) -> Void))
}
