//
//  ViewController.swift
//  DesafioGrouponLATAM
//
//  Created by Luann Marques Luna on 25/08/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import UIKit

class CityViewController: UIViewController {
    let manager = CityPresenter()
    let activyIndicator = UIActivityIndicatorView(style: .gray)
    
    var counter = 0
    var timer = Timer()
    
    private lazy var tapGesture : UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapGestureHandler(tap:)))
        return tap
    }()
    
    let lbFail: UILabel = {
        var lbl = UILabel()
        lbl.text = "Falha na conexão"
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        return lbl
    }()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: ComponentTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: "cell")
        
        pageControl.numberOfPages = 0
        pageControl.currentPage = 0
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
        
        activyIndicator.startAnimating()
        setupNavBar()
        if manager.deals.count == 0 {
            tableView.backgroundView = activyIndicator
        }
        manager.requestData(route: Router.city, onSuccess: {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.collectionView.reloadData()
                self.pageControl.numberOfPages = self.manager.banners.count
            }
        }) {
            DispatchQueue.main.async {
                self.tableView.backgroundView = self.lbFail
            }
        }
    }
    
    @objc func changeImage() {
        if self.manager.banners.count > 0 {
            if counter < self.manager.banners.count {
                let index = IndexPath.init(item: counter, section: 0)
                self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
                pageControl.currentPage = counter
                counter += 1
            } else {
                counter = 0
                let index = IndexPath.init(item: counter, section: 0)
                self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
                pageControl.currentPage = counter
                counter = 1
            }
        }
        
    }
    
    @objc private func tapGestureHandler(tap: UITapGestureRecognizer?) {
        if manager.banners.count > 0 {
            var visibleRect = CGRect()
            visibleRect.origin = collectionView.contentOffset
            visibleRect.size = collectionView.bounds.size
            let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
            let visibleIndexPath: IndexPath = collectionView.indexPathForItem(at: visiblePoint) ?? IndexPath(item: 0, section: 0)
            let index = visibleIndexPath.item
            
            if index == (manager.banners.count-1) {
                let indexPathToShow = IndexPath(item: 0, section: 0)
                self.collectionView.selectItem(at: indexPathToShow, animated: true, scrollPosition: .centeredHorizontally)
            } else {
                let indexPathToShow = IndexPath(item: (index + 1), section: 0)
                self.collectionView.selectItem(at: indexPathToShow, animated: true, scrollPosition: .centeredHorizontally)
            }
        }
    }
    
    func setupNavBar() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Buscar ofertas, lugares, etc."
        tabBarController?.navigationItem.searchController = searchController
        tabBarController?.navigationItem.hidesSearchBarWhenScrolling = false
        
        let leftButton = UIBarButtonItem(title: "São Luís ⌵", style: .plain, target: self, action: nil)
        tabBarController?.navigationItem.leftBarButtonItem = leftButton
        
        let favButton = UIBarButtonItem(image: #imageLiteral(resourceName: "like"), style: .plain, target: self, action: nil)
        let filterButton = UIBarButtonItem(image: #imageLiteral(resourceName: "filter"), style: .plain, target: self, action: nil)
        let cartButton = UIBarButtonItem(image: #imageLiteral(resourceName: "cart"), style: .plain, target: self, action: nil)
        tabBarController?.navigationItem.rightBarButtonItems = [filterButton, favButton, cartButton]
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }

}

extension CityViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if manager.deals.count > 0 {
            tableView.backgroundView = nil
        }
        return manager.deals.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ComponentTableViewCell
        cell.prepare(with: manager.deals[indexPath.section])
        
        return cell
    }
}

extension CityViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return manager.banners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BannerCollectionViewCell
        cell.prepare(with: manager.banners[indexPath.row])
        
        return cell
    }
    
    
}

extension CityViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}
