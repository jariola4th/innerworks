//
//  Constants.swift
//  InnerworksExam
//
//  Created by Joyce Ariola on 01/12/2020.
//  Copyright © 2020 Joyce Ariola. All rights reserved.
//

import UIKit

enum Network {
    static let Get = "GET"
    static let BaseURL = "https://simplifiedcoding.net"
    static let MarvelHeroes = "/demos/marvel/"
}

enum Model {
    enum HeroKey {
        static let Name = "name"
        static let RealName = "realname"
        static let Team = "team"
        static let FirstAppearance = "firstappearance"
        static let CreatedBy = "createdby"
        static let Publisher = "publisher"
        static let ImageURL = "imageurl"
        static let Bio = "bio"
    }
}

enum RequestType {
    case Get
    case Post
    case Delete
    
    var key: String {
        switch self {
        case .Get:
            return "GET"
        case .Post:
            return "POST"
        case .Delete:
            return "DELETE"
        }
    }
        
}

enum Xib {
    static let HeroCell = "HeroListTableViewCell"
}

enum SegueID {
    static let ToHeroPreview = "toHeroPreview"
}
