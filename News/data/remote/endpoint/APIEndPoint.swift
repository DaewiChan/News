//
//  APIEndPoint.swift
//  News
//
//  Created by Daewi on 5/11/23.
//

import Foundation
import Alamofire

protocol Endpoint {
    var httpMethod: HTTPMethod { get }
    var path: String { get }
    var headers: HTTPHeaders? { get }
    var parameters: [String: Any]? { get }
}

extension Endpoint {
    var url: String {
        return baseUrl + path
    }
}
