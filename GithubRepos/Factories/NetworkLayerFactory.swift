//
//  NetworkLayerFactory.swift
//  GithubRepos
//
//  Created by Mina Maged on 11/19/21.
//

import Foundation

class NetworkLayerFactory {
    
    class func getNetworkLayer(testing : Bool = false) -> NetworkLayer {
        if testing {
            return TestNetworkLayer()
        } else {
            return GithubReposNetworkLayer()
        }
    }
}
