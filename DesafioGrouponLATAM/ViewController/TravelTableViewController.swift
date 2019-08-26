//
//  TravelTableViewController.swift
//  DesafioGrouponLATAM
//
//  Created by Luann Marques Luna on 25/08/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import UIKit

class TravelTableViewController: UITableViewController {
    let manager = MenuPresenter(filename: "travel.deals.json")
    let activyIndicator = UIActivityIndicatorView(style: .gray)
    
    let lbFail: UILabel = {
        var lbl = UILabel()
        lbl.text = "Falha na conexão"
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: ComponentTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: "cell")
        
        activyIndicator.startAnimating()
        setupNavBar()
        tableView.backgroundView = activyIndicator
        manager.requestData(route: Router.travel, onSuccess: {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }) {
            DispatchQueue.main.async {
                self.tableView.backgroundView = self.lbFail
            }
        }
    }
    
    func setupNavBar() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Buscar ofertas, lugares, etc."
        tabBarController?.navigationItem.searchController = searchController
        tabBarController?.navigationItem.hidesSearchBarWhenScrolling = false
        
        let leftButton = UIBarButtonItem(title: "Viagens ⌵", style: .plain, target: self, action: nil)
        tabBarController?.navigationItem.leftBarButtonItem = leftButton
        
        let favButton = UIBarButtonItem(image: #imageLiteral(resourceName: "like"), style: .plain, target: self, action: nil)
        let filterButton = UIBarButtonItem(image: #imageLiteral(resourceName: "filter"), style: .plain, target: self, action: nil)
        tabBarController?.navigationItem.rightBarButtonItems = [filterButton, favButton]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if manager.deals.count > 0 {
            tableView.backgroundView = nil
        }
        return manager.deals.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ComponentTableViewCell
        cell.prepare(with: manager.deals[indexPath.section])
        
        return cell
    }

}
