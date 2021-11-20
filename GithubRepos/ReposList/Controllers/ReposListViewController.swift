//
//  ReposListViewController.swift
//  GithubRepos
//
//  Created by Mina Maged on 11/19/21.
//

import UIKit

class ReposListViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet var reposTableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    //MARK: - Private Properties
    private let viewModel : ReposListViewModel
    
    //MARK: - Lifecycle Methods
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
            self?.reloadTableView()
        }
        
        setupView()
        
        getRepos()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: - Private Methods
    private func setupView() {
        setupTableView()
        setupSearchBar()
        addKeyboardEvents()
    }
    
    private func setupTableView() {
        self.reposTableView.dataSource = self
        self.reposTableView.delegate = self
        
        self.reposTableView.tableFooterView = UIView() //to remove separators if tableview is empty
        
        self.reposTableView.register(UINib.init(nibName: "RepoTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    private func setupSearchBar() {
        self.searchBar.delegate = self
    }
    
    private func addKeyboardEvents() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    //MARK: - Push table view content view up
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            reposTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    //MARK: - Put table view content view back down
    @objc private func keyboardWillHide(notification: NSNotification) {
        reposTableView.contentInset = .zero
    }
    
    private func setFailureView(isHidden : Bool) {
        if isHidden {
            reposTableView.backgroundView = nil
        } else {
            let failureView = DataRetrievalErrorView.getView { [weak self] in
                self?.getRepos()
            }
            reposTableView.backgroundView = failureView
        }
    }
    
    private func getRepos() {
        view.startProgressAnim()
        setFailureView(isHidden: true)
        viewModel.getRepos {[weak self] success in
            self?.view.stopProgressAnim()
            self?.setFailureView(isHidden: success)
        }
    }
    
    private func getRepoDetails(repo: Repo, completion: @escaping ((Repo) -> Void)) {
        self.view.startProgressAnim()
        self.viewModel.getSpecificRepoDetails(repo: repo) {[weak self] (success, repo) in
            self?.view.stopProgressAnim()
            if success, let repo = repo {
                completion(repo)
            } else {
                self?.displayAlert(title: "Error", message: "Something wrong happened, please try again")
            }
        }
        
    }
    
    private func goToRepoDetails(repo: Repo) {
        let repoDetails = RepoDetailsViewController(repo: repo)
        
        self.navigationController?.pushViewController(repoDetails, animated: true)
    }
    
    //MARK:- Reload table with animation
    private func reloadTableView() {
        UIView.transition(with: reposTableView,
                          duration: 0.1,
                          options: .transitionCrossDissolve,
                          animations: { [weak self] in self?.reposTableView.reloadData() })
    }
}

//MARK: - Extension for UITableViewDataSource, UITableViewDelegate
extension ReposListViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.shownRepos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! RepoTableViewCell
        cell.bind(with: self.viewModel.shownRepos[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.reposTableView.deselectRow(at: indexPath, animated: true)
        
        self.getRepoDetails(repo: self.viewModel.shownRepos[indexPath.row]) {[weak self] (repo) in
            self?.goToRepoDetails(repo: repo)
        }
    }
}

//MARK: - Extension for UISearchBarDelegate
extension ReposListViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.viewModel.search(with: searchText)
    }
}
