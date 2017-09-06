//
//  CaseElasticViewController.swift
//  ACKit
//
//  Created by Austin Chen on 2017-05-09.
//  Copyright © 2017 Austin Chen. All rights reserved.
//

import UIKit

class CaseElasticViewController: UIViewController {

    @IBOutlet weak var elasticHeaderView: ACElasticView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension CaseElasticViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "kcell")
        cell?.textLabel?.text = "Title"
        return cell!
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // add expanding
        let offsetY = scrollView.contentOffset.y
        if offsetY > 0 {
            elasticHeaderView.cHeight = ACElasticView.maxExpandableHeight - min(50.0, offsetY)
        } else {
            elasticHeaderView.cHeight = ACElasticView.maxExpandableHeight
        }
        
        // add elasticity
        if scrollView.contentOffset.y < 0 {
            let y = abs(scrollView.contentOffset.y)
            
            elasticHeaderView.elasticZoomConstant = y
        }
    }
}
