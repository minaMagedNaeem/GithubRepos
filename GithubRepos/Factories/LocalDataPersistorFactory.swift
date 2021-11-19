//
//  LocalDataPersistorFactory.swift
//  GithubRepos
//
//  Created by Mina Maged on 11/19/21.
//

import Foundation

class LocalDataPersistorFactory {
    class func getLocalDataPersistor(unitTesting: Bool = false) -> DataPersistor {
        
        if unitTesting {
            return TestDataPersistor()
        } else {
            return RealmDataPersistor()
        }
    }
}
