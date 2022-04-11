//
//  ListRouterOutput.swift
//  GitRepos
//
//  Created by Admin on 11/04/2022.
//

import Foundation
import UIKit

struct ListRouterInput {

    func view(entryEntity: ListEntryEntity, gitHubApi: GitHubApiType) -> ListViewController {
        let view = ListViewController()
        let interactor = ListInteractor(gitHubApi: gitHubApi)
        let dependencies = ListPresenterDependencies(interactor: interactor, router: ListRouterOutput(view))
        let presenter = ListPresenter(entities: ListEntities(entryEntity: entryEntity), view: view, dependencies: dependencies)
        view.presenter = presenter
        view.tableViewDataSource = ListTableViewDataSource(entities: presenter.entities, presenter: presenter)
        interactor.presenter = presenter
        return view
    }
}

final class ListRouterOutput: Routerable {

    private(set) weak var view: Viewable!

    init(_ view: Viewable) {
        self.view = view
    }

    func transitionDetail(gitHubRepository: GitHubRepository) {
        DetailRouterInput().push(from: view, entryEntity: DetailEntryEntity(gitHubRepository: gitHubRepository))
    }
}
