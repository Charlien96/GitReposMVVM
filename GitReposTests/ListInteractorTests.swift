//
//  ListInteractorTests.swift
//  GitReposTests
//
//  Created by Admin on 11/04/2022.
//

import XCTest
@testable import GitRepos

class ListInteractorTests: XCTestCase {

    var listInteractor: ListInteractor!
    var listController: ListViewController!

    override func setUpWithError() throws {
       
        
        listController =  ListRouterInput().view(entryEntity: ListEntryEntity(language: "Swift"), gitHubApi: FakeApiTask())
    
        
    }

 
    func testGet() {
        
        let request = SearchLanguageRequest(language:"Swift", page:1)

        listController.presenter?.dependencies.interactor.fetchSearch(request: request, language:"Swift", page: 1)
        
        
        XCTAssertEqual(        listController.presenter?.entities.gitHubRepositories.count
, 30)
    }

}
