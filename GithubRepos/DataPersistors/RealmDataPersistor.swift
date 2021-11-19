//
//  RealmDataPersistor.swift
//  GithubRepos
//
//  Created by Mina Maged on 11/19/21.
//

import Foundation

class RealmDataPersistor : DataPersistor {
    func getAllRepos() -> [Repo] {
        return []
    }
    
    func getRepo(by id: String) -> [Repo] {
        return []
    }
    
    func getRepos(by pageIndex: Int) -> [Repo] {
        return []
    }
    
    func search(by searchText: String) -> [Repo] {
        return []
    }
    
    func save(repos: [Repo]) {
        
    }
    
    func save(repo: Repo) {
        
    }
}
