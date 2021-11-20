//
//  ReposListViewModelFactory.swift
//  GithubRepos
//
//  Created by Mina Maged on 11/19/21.
//

import Foundation

class ReposListViewModelFactory {
    
    class func getViewModel(testing: Bool = false) -> ReposListViewModel {
        let networkLayer = NetworkLayerFactory.getNetworkLayer(testing: testing)
        
        let viewModel = ReposListViewModel(networkLayer: networkLayer)

        return viewModel
    }
}
