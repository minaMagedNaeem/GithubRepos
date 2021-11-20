//
//  RepoTableViewCell.swift
//  GithubRepos
//
//  Created by Mina Maged on 11/19/21.
//

import UIKit

class RepoTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var repoOwnerNameLabel: UILabel!
    
    //MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        userImage.image = nil
        repoNameLabel.text = ""
        repoOwnerNameLabel.text = ""
    }
    
    //MARK: - Public Methods
    
    func bind(with repo: Repo) {
        userImage.downloadImage(url: repo.owner.avatarURL)
        
        repoNameLabel.text = repo.fullName
        repoOwnerNameLabel.text = repo.owner.login
    }
    
}
