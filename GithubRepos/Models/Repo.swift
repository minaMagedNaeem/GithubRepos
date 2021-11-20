//
//  Repo.swift
//  GithubRepos
//
//  Created by Mina Maged on 11/19/21.
//

import Foundation

class Repo: Codable {
    let id: Int
    let nodeID, name, fullName: String
    let owner: RepoOwner
    let url: String
    let htmlUrl: String
    let description : String?
    let createdAt : String?
    let language : String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case name
        case fullName = "full_name"
        case owner
        case url
        case description
        case createdAt = "created_at"
        case language
        case htmlUrl = "html_url"
    }
    
    init(id: Int, nodeID: String, name: String, fullName: String, owner: RepoOwner, url: String, description: String, createdAt: String, language: String, htmlUrl: String) {
        self.id = id
        self.nodeID = nodeID
        self.name = name
        self.fullName = fullName
        self.owner = owner
        self.url = url
        self.description = description
        self.createdAt = createdAt
        self.language = language
        self.htmlUrl = htmlUrl
    }
}
