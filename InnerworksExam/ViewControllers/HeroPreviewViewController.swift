//
//  HeroPreviewViewController.swift
//  InnerworksExam
//
//  Created by Joyce Ariola on 01/12/2020.
//  Copyright © 2020 Joyce Ariola. All rights reserved.
//

import UIKit

class HeroPreviewViewController: BaseViewController {
    
    @IBOutlet var heroPreviewView: HeroPreviewView!
    var hero: Hero?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func initDelegates() {
        super.initDelegates()
        heroPreviewView.delegate = self
    }
    
    override func initScreen() {
        super.initScreen()
        heroPreviewView.initWithHero(hero)

    }
    
}

// MARK: Public Functions
extension HeroPreviewViewController {
    
}

// MARK: Private Functions
extension HeroPreviewViewController {
    
    private func searchGoogle(keyword: String) {
        let urlString = "https://www.google.com.au/search?client=safari&channel=ipad_bm&source=hp&ei=PSrkWqHVDYrc8QXp85zoAw&q=\(keyword)&oq=example&gs_l=mobile-gws-wiz-hp.3..0l5.58620.59786..60164...0....334.1724.0j2j3j2..........1.......3..41j0i131.SurD5PmVspw%3D"
        
        guard let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url)
    }
    
}

// MARK: HeroPreviewViewDelegate
extension HeroPreviewViewController: HeroPreviewViewDelegate {
    
    func didPressCloseButtonInView(_ view: HeroPreviewView) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func didPressImageVewInView(_ view: HeroPreviewView) {
        guard let _ = hero else { return }
        guard let search = hero!.name else { return }
        
        let keyword = search.replacingOccurrences(of: " ", with: "+")
        searchGoogle(keyword: keyword)
    }
    
    
}
