//
//  ReposListViewController.swift
//  GithubRepos
//
//  Created by Mina Maged on 11/19/21.
//

import UIKit

class ReposListViewController: UIViewController {
    
    @IBOutlet var reposTableView: UITableView!
    
    let viewModel : ReposListViewModel
    
    init(viewModel: ReposListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.changeCompletion = { [weak self] in
            self?.reposTableView.reloadData()
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    func getRepos() {
        viewModel.getRepos { success in
            
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
