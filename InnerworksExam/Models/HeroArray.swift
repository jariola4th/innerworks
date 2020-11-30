//
//  HeroArray.swift
//  InnerworksExam
//
//  Created by Joyce Ariola on 01/12/2020.
//  Copyright © 2020 Joyce Ariola. All rights reserved.
//

import UIKit

struct HeroArray: Decodable {
    private var heroArray: Array<Hero>?
    
    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        heroArray = try container.decode(Array<Hero>.self)
        
    }
    
    init(array: Array<Any>?){
        guard let _ = array else {
            return
        }
        
        if array!.count < 1 {
            return
        }
        heroArray = Array<Hero>()
        
        for i in array! {
            let hero: Hero = Hero(dictionary: i as! [String : Any])
            heroArray?.append(hero)
        }
        
    }
    
}

// MARK: Public Functions
extension HeroArray {
    
    func count() -> Int {
//        guard let _ = heroArray else {
//            return 0
//        }
        return heroArray?.count ?? 0
    }
    
    func heroAtIndex(_ index: Int) -> Hero? {
        guard let _ = heroArray else { return nil }
        if heroArray!.count < 1 { return nil }
        if index >= heroArray!.count { return nil }
        return heroArray![index]
    }
    
}
