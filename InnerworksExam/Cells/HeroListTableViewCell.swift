//
//  HeroListTableViewCell.swift
//  InnerworksExam
//
//  Created by Joyce Ariola on 01/12/2020.
//  Copyright © 2020 Joyce Ariola. All rights reserved.
//

import UIKit

class HeroListTableViewCell: UITableViewCell {
    @IBOutlet var baseView: UIView!
    @IBOutlet var heroImageView: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    
    var hero: Hero?
    
}

// MARK: Public Functions
extension HeroListTableViewCell {
    
    func setWithHero(_ hero: Hero?) {
        guard let _ = hero else {
            return
        }
        self.hero = hero
        descriptionLabel.text = hero?.name
        
        guard let _ = hero!.imageURL else { return }
        heroImageView.downloaded(from: hero!.imageURL!)
    }
    
}

// MARK: Private Functions
extension HeroListTableViewCell {
    
}
