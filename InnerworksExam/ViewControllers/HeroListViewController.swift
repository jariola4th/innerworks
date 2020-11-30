//
//  HeroListViewController.swift
//  InnerworksExam
//
//  Created by Joyce Ariola on 01/12/2020.
//  Copyright © 2020 Joyce Ariola. All rights reserved.
//

import UIKit

class HeroListViewController: BaseViewController {
    
    @IBOutlet var heroListView: HeroListView!
    var heroes: HeroArray?
    var selectedHero: Hero?
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func initDelegates() {
        super.initDelegates()
        self.heroListView.tableView.delegate = self
        self.heroListView.tableView.dataSource = self
    }
    
    override func initData() {
        super.initData()
        fetchHeroes()
    }
    
    override func initScreen() {
        heroListView.initTableView()
        initPullToRefresh()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueID.ToHeroPreview {
            let destinationVC: HeroPreviewViewController = segue.destination as! HeroPreviewViewController
            destinationVC.hero = selectedHero
        }
    }
    
}

// MARK: Public Functions
extension HeroListViewController {
    
}

// MARK: Private Functions
extension HeroListViewController {
    
    private func initPullToRefresh() {
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        heroListView.tableView.addSubview(refreshControl)
    }
    
    @objc private func refresh(_ sender: AnyObject) {
        fetchHeroes()
    }
    
    private func fetchHeroes() {
        APIManager.sharedInstance.getHeroes(onSuccess: { result in
            self.heroes = result
            DispatchQueue.main.async {
                self.heroListView.tableView.reloadData()
                self.refreshControl.endRefreshing()
            }
        }, onFailure: { error in
            self.refreshControl.endRefreshing()
            self.showAlert(
                title: "Error fetching",
                description: error.localizedDescription,
                actionCompletion: {})
        })
    }
    
    
}

// MARK: Public Functions
extension HeroListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes?.count() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Xib.HeroCell, for: indexPath) as! HeroListTableViewCell
        cell.setWithHero(heroes?.heroAtIndex(indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let hero = heroes?.heroAtIndex(indexPath.row) else { return }
        selectedHero = hero
        performSegue(withIdentifier: SegueID.ToHeroPreview, sender: nil)
    }
    
    
}
