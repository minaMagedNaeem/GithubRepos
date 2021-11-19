//
//  LocalDataPersistorFactory.swift
//  GithubRepos
//
//  Created by Mina Maged on 11/19/21.
//

import Foundation

class LocalDataPersistorFactory {
    class func getLocalDataPersistor(testing: Bool = false) -> DataPersistor {
        
        if testing {
            return TestDataPersistor()
        } else {
            return RealmDataPersistor()
        }
    }
}
