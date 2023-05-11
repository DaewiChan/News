//
//  NewsEndPoint.swift
//  News
//
//  Created by Daewi on 5/11/23.
//

import Foundation
import Alamofire

enum NewsEndPoint: Endpoint{
    
    case getNews(request: NewsRequest)
    
    var httpMethod: HTTPMethod{
        switch self {
        case .getNews:
            return .get
        }
    }
    
    var path: String{
        switch self {
        case .getNews(let request):
            return "everything?q=\(request.key ?? "")&apiKey=7b624cf7f6dd432f8d7bf0ce96804b06&page=\(request.page ?? 1)&pageSize=50"
        }
    }
    
    var headers: Alamofire.HTTPHeaders?{
        switch self {
        case .getNews:
            return ["Accept": "application/json"]
        }
    }
    
    var parameters: [String : Any]?{
        switch self {
        case .getNews:
            return nil
        }
    }
    
    
}
