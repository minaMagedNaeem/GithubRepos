//
//  ReposListViewModel.swift
//  GithubRepos
//
//  Created by Mina Maged on 11/19/21.
//

import Foundation

class ReposListViewModel {
    
    let dataPersistor : DataPersistor
    
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
    
    init(dataPersistor: DataPersistor, networkLayer: NetworkLayer) {
        self.dataPersistor = dataPersistor
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
    
    func search(with text: String) {
        
        if text.isEmpty {
            self.shownRepos = self.allRepos
            return
        }
        
        self.shownRepos = self.allRepos.filter({ $0.fullName.contains(text.trimmingCharacters(in: .whitespacesAndNewlines).lowercased())})
    }
}
