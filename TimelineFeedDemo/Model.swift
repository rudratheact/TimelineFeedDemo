//
//  Model.swift
//  TimelineFeedDemo
//
//  Created by Rudra Misra on 10/28/21.
//

import Foundation

var feeds = [Feeds]()

struct Feeds{
    var title: String?
    var postDate: String?
    var postDescription: String?
    var media: String?
    var likes: Bool?
    var hearts: Bool?
    var lols: Bool?
    var interactions: Int?
}

var comments = [Comments]()

struct Comments{
    var userName: String?
    var postDescription: String?
    var media: String?
}
