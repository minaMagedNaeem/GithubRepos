//
//  ReposListViewModelFactory.swift
//  GithubRepos
//
//  Created by Mina Maged on 11/19/21.
//

import Foundation

class ReposListViewModelFactory {
    
    class func getViewModel(testing: Bool = false) -> ReposListViewModel {
        
        let dataPersistor = LocalDataPersistorFactory.getLocalDataPersistor(testing: testing)
        
        let networkLayer = NetworkLayerFactory.getNetworkLayer(testing: testing)
        
        let viewModel = ReposListViewModel(dataPersistor: dataPersistor, networkLayer: networkLayer)
        
        return viewModel
    }
}
