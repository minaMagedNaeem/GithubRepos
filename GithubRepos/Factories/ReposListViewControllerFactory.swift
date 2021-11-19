//
//  ReposListViewControllerFactory.swift
//  GithubRepos
//
//  Created by Mina Maged on 11/19/21.
//

import Foundation

class ReposListViewControllerFactory {
    
    class func getViewController() -> ReposListViewController {
        
        let viewModel = ReposListViewModelFactory.getViewModel(testing: false)
        
        let viewController = ReposListViewController(viewModel: viewModel)
        
        return viewController
    }
    
}
