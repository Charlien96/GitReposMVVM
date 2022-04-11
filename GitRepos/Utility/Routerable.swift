//
//  Routerable.swift
//  GitRepos
//
//  Created by Admin on 11/04/2022.
//

import Foundation

protocol Routerable {
    var view: Viewable! { get }
    func pop(animated: Bool)
}

extension Routerable {
    func pop(animated: Bool) {
        view.pop(animated: animated)
    }
}
