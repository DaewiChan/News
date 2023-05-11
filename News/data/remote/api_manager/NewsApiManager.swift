//
//  NewsApiManager.swift
//  News
//
//  Created by Daewi on 5/11/23.
//

import Foundation
import SwiftyJSON
import ObjectMapper
import Alamofire
import RxSwift

class NewsApiManager{
    static let shared = NewsApiManager()
    let mApiClient = APIClient.shared
    
    func getNews(_ endPoint: NewsEndPoint) -> Observable<NewsResponse> {
        return Observable.create { observer -> Disposable in
            self.mApiClient.requestGETURL(endPoint.url, endPoint.parameters as? [String : AnyObject] ?? [:], headers: endPoint.headers, success: { (response) in
                let responseJSON = JSON(response)
                let resp = Mapper<NewsResponse>().map(JSONString: responseJSON.rawString()!)
                observer.onNext(resp!)
            }) { (error) in
                observer.onError(error)
            }
            return Disposables.create()
        }
    }
}
