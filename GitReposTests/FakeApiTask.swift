//
//  FakeApiTask.swift
//  GitReposTests
//
//  Created by Admin on 11/04/2022.
//

import Foundation
@testable import GitRepos


class FakeApiTask: GitHubApiType {
    
    func search(with request: SearchLanguageRequest, completion: @escaping ((Result<SearchRepositoriesResponse, ApiError>) -> Void)) {
        
        let bundle = Bundle(for:FakeApiTask.self)
        
        guard let url = bundle.url(forResource:"search_responce_success", withExtension:"json"),
              let data = try? Data(contentsOf: url) else {
                  completion(.failure(ApiError.recieveNilResponse))
                  return
              }
        
        do {
            let decodedResopnce = try JSONDecoder().decode(SearchRepositoriesResponse.self, from: data)
            completion(.success(decodedResopnce))
            
        }catch {
            completion(.failure(ApiError.failedParse))
        }
        
    }
}
