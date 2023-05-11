//
//  NewsApiService.swift
//  News
//
//  Created by Daewi on 5/11/23.
//

import Foundation
import RxSwift

class NewsApiService {
    
    static let shared = NewsApiService()
    
    // MARK: User
    
    func getNewsLists(_ newsEndPoint: NewsEndPoint) -> Observable<NewsResponse> {
        return NewsApiManager.shared.getNews(newsEndPoint)
    }
}
