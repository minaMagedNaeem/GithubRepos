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
        
        let networkLayer = NetworkLayerFactory.getNetworkLayer()
        
        let viewModel = ReposListViewModel(dataPersistor: dataPersistor, networkLayer: networkLayer)
        
        return viewModel
    }
}
