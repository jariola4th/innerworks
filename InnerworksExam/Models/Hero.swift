//
//  Hero.swift
//  InnerworksExam
//
//  Created by Joyce Ariola on 01/12/2020.
//  Copyright © 2020 Joyce Ariola. All rights reserved.
//

struct Hero: Codable {
    var name: String?
    var realName: String?
    var team: String?
    var firstAppearance: String?
    var createdBy: String?
    var publisher: String?
    var imageURL: String?
    var bio: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case realName = "realname"
        case team
        case firstAppearance = "firstappearance"
        case createdBy = "createdby"
        case publisher
        case imageURL = "imageurl"
        case bio
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try  container.decode(String.self, forKey: .name)
        realName = try  container.decode(String.self, forKey: .realName)
        team = try  container.decode(String.self, forKey: .team)
        firstAppearance = try  container.decode(String.self, forKey: .firstAppearance)
        createdBy = try  container.decode(String.self, forKey: .createdBy)
        publisher = try  container.decode(String.self, forKey: .publisher)
        imageURL = try  container.decode(String.self, forKey: .imageURL)
        bio = try  container.decode(String.self, forKey: .bio)
    }
    
    init(dictionary: [String:Any]) {
        name = dictionary[Model.HeroKey.Name] as? String
        realName = dictionary[Model.HeroKey.RealName] as? String
        team = dictionary[Model.HeroKey.Team] as? String
        firstAppearance = dictionary[Model.HeroKey.FirstAppearance] as? String
        createdBy = dictionary[Model.HeroKey.CreatedBy] as? String
        publisher = dictionary[Model.HeroKey.Publisher] as? String
        imageURL = dictionary[Model.HeroKey.ImageURL] as? String
        bio = dictionary[Model.HeroKey.Bio] as? String
    }
}
