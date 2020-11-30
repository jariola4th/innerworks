//
//  HeroListView.swift
//  InnerworksExam
//
//  Created by Joyce Ariola on 01/12/2020.
//  Copyright © 2020 Joyce Ariola. All rights reserved.
//

import UIKit

class HeroListView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
}

// MARK: Public Functions
extension HeroListView {
    
    func initTableView() {
        initCell()
        tableView.rowHeight = 75
    }
}

// MARK: Private Functions
extension HeroListView {
    
    private func initCell() {
    tableView.register(UINib.init(nibName: Xib.HeroCell, bundle: nil), forCellReuseIdentifier:  Xib.HeroCell)
    }
    
}
