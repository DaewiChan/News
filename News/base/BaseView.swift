//
//  BaseView.swift
//  News
//
//  Created by Daewi on 5/11/23.
//

import Foundation

@objc protocol BaseView {
    func startLoading()
    func finishLoading()
    func setEmptyView()
    func showErrorView(title: String,message: String)
}
