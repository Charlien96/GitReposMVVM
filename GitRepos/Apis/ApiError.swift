//
//  ApiError.swift
//  GitRepos
//
//  Created by Charlie on 11/04/2022.
//

import Foundation

enum ApiError: Error , Equatable {
    case recieveNilResponse
    case recieveErrorHttpStatus
    case recieveNilBody
    case failedParse
    case customError(Int)
}
