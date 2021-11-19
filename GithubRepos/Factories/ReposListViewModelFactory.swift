//
//  ReposListViewModelFactory.swift
//  GithubRepos
//
//  Created by Mina Maged on 11/19/21.
//

import Foundation

class ReposListViewModelFactory {
    
    class func getViewModel() -> ReposListViewModel {
        
        let dataPersistor = LocalDataPersistorFactory.getLocalDataPersistor()
        
        let viewModel = ReposListViewModel(dataPersistor: dataPersistor)
        
        return viewModel
    }
}
