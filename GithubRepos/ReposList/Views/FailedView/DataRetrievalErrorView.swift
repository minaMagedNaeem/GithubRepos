//
//  DataRetrievalErrorView.swift
//  GithubRepos
//
//  Created by Mina Maged on 11/19/21.
//

import Foundation
import UIKit

class DataRetrievalErrorView : UIView {
    //MARK: - Public closures
    var completion : (() -> ())?
    
    //MARK: - IBActions
    @IBAction func tryAgainPressed(_ sender: Any) {
        if let completion = self.completion {
            completion()
        }
    }
    
    //MARK: - Static functions
    class func getView(completion: @escaping (() -> Void)) -> DataRetrievalErrorView {
        let failureView = DataRetrievalErrorView.instanceFromNib()
        failureView.completion = completion
        
        return failureView
    }

    class func instanceFromNib() -> DataRetrievalErrorView {
        return UINib(nibName: "DataRetrievalErrorView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! DataRetrievalErrorView
    }
}
