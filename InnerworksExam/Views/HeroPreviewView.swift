//
//  HeroPreviewView.swift
//  InnerworksExam
//
//  Created by Joyce Ariola on 01/12/2020.
//  Copyright © 2020 Joyce Ariola. All rights reserved.
//

import UIKit

protocol HeroPreviewViewDelegate: AnyObject {
    func didPressCloseButtonInView(_ view: HeroPreviewView)
    func didPressImageVewInView(_ view: HeroPreviewView)
}

class HeroPreviewView: UIView {
    
    @IBOutlet var closeButton: UIButton!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var heroImageView: UIImageView!
    @IBOutlet var realNameLabel: UILabel!
    @IBOutlet var teamLabel: UILabel!
    @IBOutlet var bioLabel: UILabel!
    
    let imageCache = NSCache<NSString, UIImage>()
    
    weak var delegate: HeroPreviewViewDelegate?
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        delegate?.didPressCloseButtonInView(self)
    }
    
}

// MARK: Public Functions
extension HeroPreviewView {
    
    func initWithHero(_ hero: Hero?) {
        guard let _ = hero else { return }
        nameLabel.text = hero?.name
        realNameLabel.text = hero?.realName
        teamLabel.text = hero?.team
        bioLabel.text = hero?.bio

        setImageViewWithURL(url: hero!.imageURL)
    }
    
}

// MARK: Private Functions
extension HeroPreviewView {
    
    private func setImageViewWithURL(url: String?) {
        heroImageView.isUserInteractionEnabled = true
        heroImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped)))
        
        guard let _ = url else { return }
        heroImageView.downloaded(from: url!)
    }
    
    @objc private func imageTapped(_ recognizer: UITapGestureRecognizer) {
        delegate?.didPressImageVewInView(self)
    }
}
