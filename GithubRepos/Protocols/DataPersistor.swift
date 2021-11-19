//
//  DataPersistor.swift
//  GithubRepos
//
//  Created by Mina Maged on 11/19/21.
//

import Foundation
protocol DataPersistor {
    func getAllRepos() -> [Repo]
    
    func getRepo(by id: String) -> [Repo]
    
    func getRepos(by pageIndex: Int) -> [Repo]
    
    func search(by searchText: String) -> [Repo]
    
    func save(repos: [Repo])
    
    func save(repo: Repo)
}
