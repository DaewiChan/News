//
//  MainVC.swift
//  News
//
//  Created by Daewi on 5/11/23.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var tfSearchNews: TextFieldExt!
    @IBOutlet weak var tblNews: UITableView!
    @IBOutlet weak var ivSearch: UIImageView!
    
    private let _presenter = MainPresenter(newsApiService: NewsApiService())
    
    var newsLists: [ArticlesDataVO]?
    
    var currentPageNo: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _presenter.attachView(view: self)
        setupUI()
        loadData()
        catchEvent()
    }
    
    func setupUI(){
        tfSearchNews.addBorder()
        tfSearchNews.placeholder = "Search"
        
        setupTableView()
       
    }
    
    func loadData(){
        _presenter.getNewsLists("bitcoin", currentPageNo)
    }
    
    func catchEvent(){
        let tapSearch = UITapGestureRecognizer(target: self, action: #selector(searchNews))
        tapSearch.numberOfTouchesRequired = 1
        ivSearch.isUserInteractionEnabled = true
        ivSearch.addGestureRecognizer(tapSearch)
    }
    
    @objc func searchNews(){
        if validateInputData(){
            _presenter.getNewsLists(tfSearchNews.text ?? "", currentPageNo)
        }
    }

    func setupTableView(){
        tblNews.register(UINib(nibName: String(describing: NewsItemCell.self), bundle: nil), forCellReuseIdentifier: String(describing: NewsItemCell.self))
      //  tblNews.setupTableView(String(describing: NewsItemCell.self))
        tblNews.delegate = self
        tblNews.dataSource = self
    }
    
    func validateInputData() -> Bool{
        if ((tfSearchNews.text?.isEmpty) == nil){
            return false
        }else{
            return true
        }
    }
    
    func openNewsDetails(_ data: ArticlesDataVO){
        let detailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "news_details") as! NewsDetailsVC
        detailsVC.newsData = data
        detailsVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsLists?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsItemCell", for: indexPath) as! NewsItemCell
        if let data = newsLists?[indexPath.row]{
            cell.newsData = data
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let newsInfo = newsLists?[indexPath.row] else { return }
        openNewsDetails(newsInfo)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}

extension MainVC: MainView{
    func showNewsLists(_ data: [ArticlesDataVO]) {
        self.newsLists = data
        tblNews.reloadData()
    }
    
    func startLoading() {
        
    }
    
    func finishLoading() {
        
    }
    
    func setEmptyView() {
        
    }
    
    func showErrorView(title: String, message: String) {
        
    }
}
