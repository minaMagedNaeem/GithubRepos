//
//  GithubReposTests.swift
//  GithubReposTests
//
//  Created by Mina Maged on 11/19/21.
//

import XCTest
@testable import GithubRepos

class GithubReposTests: XCTestCase {
    
    var viewModel : ReposListViewModel!

    override func setUpWithError() throws {
        self.viewModel = ReposListViewModelFactory.getViewModel(testing: true)
        
        let expectation = self.expectation(description: "GettingCharacters")
        
        viewModel.getRepos { (success) in
            XCTAssertTrue(success)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 3, handler: nil)
    }

    override func tearDownWithError() throws {
        self.viewModel = nil
    }

    func testSearchRepos() throws {
        
        let searchText : String = "ano"
        
        viewModel.search(with: searchText)
        
        let repos = viewModel.shownRepos
        
        for repo in repos {
            XCTAssert(repo.fullName.contains(searchText), "Error in test case. Expected text that has substring \(searchText), found \(repo.fullName)")
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
