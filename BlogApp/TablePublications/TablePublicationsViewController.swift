//
//  TablePublicationsViewController.swift
//  BlogApp
//
//  Created by Jesus Alberto Diaz Dominguez on 30/05/22.
//

import UIKit

class TablePublicationsViewController: UIViewController {

    @IBOutlet weak var postSearch: UISearchBar!
    @IBOutlet weak var tablePostTable: UITableView!
    @IBOutlet weak var lblTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.textAlignment = .center
        lblTitle.text = "Publicaciones"
    }
}
