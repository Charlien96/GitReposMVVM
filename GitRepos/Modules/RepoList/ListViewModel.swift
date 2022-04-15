//
//  ListViewModel.swift
//  GitRepos
//
//  Created by Admin on 13/04/2022.
//

import Foundation

class ListViewModel {
    
    var entities: ListEntities
    private var gitHubApi: GitHubApiType
    private weak var view: ListViewInputs!
    
    init(gitHubApi: GitHubApiType, entities: ListEntities, view: ListViewInputs ) {
        self.gitHubApi = gitHubApi
        self.entities = entities
        self.view = view
    }
    
    func fetchSearch(request: SearchLanguageRequest) {
        fetchRepo(request: request)
    }
    
    private func fetchRepo(request:SearchLanguageRequest) {
       
        gitHubApi.search(with: request) {[weak self] result in
            switch result {
            case .success(let res):
                self?.entities.searchApiState.isFetching = false
                self?.entities.searchApiState.pageCount += 1
                self?.entities.gitHubRepositories += res.items
                self?.view.reloadTableView()
                self?.view.indicatorView(animate: false)
            case .failure(_):
                self?.view.indicatorView(animate: false)
            }
        }
    }
    
    func onReachBottom() {
        guard !entities.searchApiState.isFetching else { return }
        entities.searchApiState.isFetching = true
        
        let request = SearchLanguageRequest(language: entities.entryEntity.language, page: entities.searchApiState.pageCount)

        fetchSearch(request: request)
        
        view.indicatorView(animate: true)
    }
    
}
