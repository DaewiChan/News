//
//  NewsItemCell.swift
//  News
//
//  Created by Daewi on 5/11/23.
//

import UIKit
import Kingfisher


class NewsItemCell: UITableViewCell {
    
    @IBOutlet weak var ivNews: UIImageView!
    @IBOutlet weak var lblSource: UILabel!
    @IBOutlet weak var lblAuthorBy: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblPublishAt: UILabel!
    

//    @IBOutlet weak var ivNews: UIImageView!
//    @IBOutlet weak var lblSource: UILabel!
//    @IBOutlet weak var lblAuthorBy: UILabel!
//    @IBOutlet weak var lblTitle: UILabel!
//    @IBOutlet weak var lblPublishAt: UILabel!
    
    var newsData: ArticlesDataVO?{
        didSet{
            showInfo()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func showInfo(){
        if let sourceName = newsData?.source?.name{
            lblSource.text = sourceName
        }
        
        if let author = newsData?.author{
            lblAuthorBy.text = author
        }
        
        if let title = newsData?.title{
            lblTitle.text = title
        }
        
        if let publishAt = newsData?.publishAt{
            lblPublishAt.text = publishAt
        }
        
        if let imageUrl = newsData?.urlToImage, let url = URL(string: imageUrl){
            ivNews.kf.setImage(with: url)
        }else{
            ivNews.image = UIImage(named: "news_default")
        }
    }
    
}
