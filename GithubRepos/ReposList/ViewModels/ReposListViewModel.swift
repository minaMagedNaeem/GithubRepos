//
//  ReposListViewModel.swift
//  GithubRepos
//
//  Created by Mina Maged on 11/19/21.
//

import Foundation

class ReposListViewModel {
    
    let networkLayer : NetworkLayer
    
    private var allRepos : [Repo] = [] {
        didSet {
            self.shownRepos = allRepos
        }
    }
    
    var shownRepos : [Repo] = [] {
        didSet {
            changeCompletion?()
        }
    }
    
    var changeCompletion : (() -> Void)?
    
    init(networkLayer: NetworkLayer) {
        self.networkLayer = networkLayer
    }
    
    func getRepos(retrievalCompletion: @escaping ((_ success: Bool) -> Void)) {
        networkLayer.getRepos {[weak self] (success : Bool, repos : [Repo]?) in
            if success, let repos = repos {
                self?.allRepos = repos
                retrievalCompletion(true)
            } else {
                retrievalCompletion(false)
            }
        }
    }
    
    func getSpecificRepoDetails(repo: Repo, completion: @escaping ((_ success: Bool, _ repo: Repo?) -> Void)) {
        networkLayer.getRepo(url: repo.url) { (success : Bool, repo : Repo?) in
            if success, let repo = repo {
                completion(true, repo)
            } else {
                completion(false, nil)
            }
        }
    }
    
    func search(with text: String) {
        
        if text.isEmpty {
            self.shownRepos = self.allRepos
            return
        }
        
        self.shownRepos = self.allRepos.filter({ $0.fullName.contains(text.trimmingCharacters(in: .whitespacesAndNewlines).lowercased())})
    }
}
