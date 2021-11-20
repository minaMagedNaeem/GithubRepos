//
//  RepoDetailsViewController.swift
//  GithubRepos
//
//  Created by Mina Maged on 11/19/21.
//

import UIKit

class RepoDetailsViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var ownerImage: UIImageView!
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var repoOwnerNameLabel: UILabel!
    @IBOutlet weak var urlButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var langLabel: UILabel!
    @IBOutlet weak var creationLabel: UILabel!
    
    //MARK: - Global Variables
    let repo : Repo
    
    //MARK: - Lifecycle Methods
    init(repo: Repo) {
        self.repo = repo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindView()
    }
    
    //MARK: - IBActions
    @IBAction func urlPressed(_ sender: Any) {
        if let url = URL(string: self.repo.htmlUrl), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    //MARK: - Private Methods
    
    private func bindView() {
        self.title = repo.fullName
        self.ownerImage.downloadImage(url: repo.owner.avatarURL)
        self.repoNameLabel.text = repo.fullName
        self.repoOwnerNameLabel.text = repo.owner.login
        self.urlButton.setTitle(repo.htmlUrl, for: .normal)
        self.descriptionLabel.text = repo.description
        self.langLabel.text = "Language: \(repo.language ?? "Not available")"
        self.creationLabel.text = repo.createdAt
    }
}
