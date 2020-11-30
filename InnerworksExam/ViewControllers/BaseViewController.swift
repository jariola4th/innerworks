//
//  BaseViewController.swift
//  InnerworksExam
//
//  Created by Joyce Ariola on 01/12/2020.
//  Copyright © 2020 Joyce Ariola. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super .viewDidLoad()
        initDelegates()
        initData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initScreen()
    }
    
    func initDelegates() {
        
    }
    
    func initData() {
        
    }
    
    func initScreen() {
        
    }
    
    func showAlert(
        title: String?,
        description: String?,
        actionCompletion: @escaping () -> Void) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title ?? "", message: description ?? "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { (action: UIAlertAction!) in
                actionCompletion()
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
}
