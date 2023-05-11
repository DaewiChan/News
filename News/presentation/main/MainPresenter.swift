//
//  MainPresenter.swift
//  News
//
//  Created by Daewi on 5/11/23.
//

import Foundation

protocol MainView: BaseView{
    func showNewsLists(_ data : [ArticlesDataVO])
}

class MainPresenter: BasePresenter{
    private let newsApiService: NewsApiService?
    
    private var view: MainView?

    init(newsApiService: NewsApiService) {
        self.newsApiService = newsApiService
    }

    func attachView(view: MainView) {
        self.view = view
    }

    func detachView() {
        view = nil
    }
    
    func getNewsLists(_ key: String, _ pageNo: Int) {
        self.view?.startLoading()
        let req = NewsRequest()
        req.key = key
        req.page = pageNo
        
        let newsReq = NewsEndPoint.getNews(request: req)
        newsApiService?.getNewsLists(newsReq)
            .subscribe(
                onNext: { [weak self] response in
                    self?.view?.finishLoading()
                    if let newsList = response.articles {
                        self?.view?.showNewsLists(newsList)
                    }
                }, onError: { error in
                    self.view?.finishLoading()
                }).disposed(by: disposeBag)
    }
}
