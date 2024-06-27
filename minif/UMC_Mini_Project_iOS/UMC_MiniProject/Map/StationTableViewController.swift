//
//  StationTableViewController.swift
//  miniProject-home
//
//  Created by 김민지 on 5/26/24.
//

import UIKit

class StationTableViewController: UITableViewController {

    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adjustTableViewHeight()
    }
    
    func adjustTableViewHeight(){
        let contentHeight = tableView.contentSize.height
        tableViewHeightConstraint.constant = contentHeight
    }

}
