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
    
    var onReposRetrievalCompletion : ((_ success: Bool) -> Void)!
    
    init(dataPersistor: DataPersistor, networkLayer: NetworkLayer) {
        self.dataPersistor = dataPersistor
        self.networkLayer = networkLayer
    }
    
    
    
}
