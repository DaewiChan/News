//
//  UITableView.swift
//  News
//
//  Created by Daewi on 5/11/23.
//

import Foundation
import UIKit

extension UITableView{
    func setupTableView(_ cellNibName: String,noFooter: Bool = true){
        self.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.separatorStyle = .none
        self.estimatedRowHeight = 80.0
        self.rowHeight = UITableView.automaticDimension
        self.showsVerticalScrollIndicator = false
        if noFooter {
            self.tableFooterView = UIView()
        }
        self.register(UINib(nibName: cellNibName, bundle: nil), forCellReuseIdentifier: cellNibName)
    }
}
