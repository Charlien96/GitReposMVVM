//
//  Collection.swift
//  GitRepos
//
//  Created by Admin on 11/04/2022.
//

import Foundation

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
