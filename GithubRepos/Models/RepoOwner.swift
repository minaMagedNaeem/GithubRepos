//
//  RepoOwner.swift
//  GithubRepos
//
//  Created by Mina Maged on 11/19/21.
//

import Foundation

class RepoOwner: Codable {
    let login: String
    let id: Int
    let avatarURL: String
    
    enum CodingKeys: String, CodingKey {
        case login, id
        case avatarURL = "avatar_url"
    }
    
    init(login: String, id: Int, avatarURL: String) {
        self.login = login
        self.id = id
        self.avatarURL = avatarURL
    }
}
