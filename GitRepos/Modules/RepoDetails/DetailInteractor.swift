//
//  DetailInteractor.swift
//  GitRepos
//
//  Created by Admin on 11/04/2022.
//

import Foundation

protocol DetailInteractorOutputs: AnyObject {

}

final class DetailInteractor: Interactorable {
    weak var presenter: DetailInteractorOutputs?
}
