//
//  NewsDetailsVC.swift
//  News
//
//  Created by Daewi on 5/11/23.
//

import UIKit
import Kingfisher

class NewsDetailsVC: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblAuthorBy: UILabel!
    @IBOutlet weak var lblPushlishAt: UILabel!
    @IBOutlet weak var ivNews: UIImageView!
    @IBOutlet weak var lblContent: UILabel!
    
    var newsData: ArticlesDataVO?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        showInfo()
    }

    func showInfo(){
        if let title = newsData?.title{
            lblTitle.text = title
        }
        
         if let description = newsData?.description{
            lblDescription.text = description
        }
        
         if let author = newsData?.author{
            lblAuthorBy.text = author
        }
        
         if let pushlishDate = newsData?.publishAt{
            lblPushlishAt.text = pushlishDate
        }
        
        if let imageUrl = newsData?.urlToImage, let url = URL(string: imageUrl){
            ivNews.kf.setImage(with: url)
        }
        
        if let content = newsData?.content{
            lblContent.text = content
        }
        
    }
}
