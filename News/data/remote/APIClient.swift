//
//  APIClient.swift
//  News
//
//  Created by Daewi on 5/11/23.
//

import Foundation
import Alamofire

class APIClient: NSObject{
    static let shared = APIClient()
    
    func requestGETURL(_ strURL: String,_ params: [String : AnyObject]?,headers: HTTPHeaders?, success:@escaping (Any) -> Void, failure:@escaping (Error) -> Void) {
        AF.request(strURL, method: .get,parameters: params, encoding: URLEncoding.queryString, headers: headers)
            .validate(statusCode: 200 ..< 600)
            .responseJSON { response in
                print("GET API Response : \(response.request?.url?.absoluteString ?? "") :> \(response.result)")
            switch response.result {
                case .success:
                    if let json = response.data {
                        success(json)
                    }
                case let .failure(error):
                    failure(error)
            }
        }
    }
}
