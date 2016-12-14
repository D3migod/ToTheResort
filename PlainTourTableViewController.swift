//
//  PlainTourTableViewController.swift
//  ToTheResort
//
//  Created by Булат Галиев on 30.11.16.
//  Copyright © 2016 Булат Галиев. All rights reserved.
//

import UIKit

class PlainTourTableViewController: UITableViewController, RequirementsSaver {
    
    var tourPackages = [TourPackage]()//Array(repeating: TourPackage(), count: 10)
    var filteredTourPackages = [TourPackage]()
    let images = ["1":#imageLiteral(resourceName: "exc_1"), "2":#imageLiteral(resourceName: "exc_2"), "3":#imageLiteral(resourceName: "exc_3"), "4":#imageLiteral(resourceName: "exc_4"), "5":#imageLiteral(resourceName: "exc_5"), "6": #imageLiteral(resourceName: "exc_6"), "7": #imageLiteral(resourceName: "exc_7"), "8": #imageLiteral(resourceName: "exc_8"), "9": #imageLiteral(resourceName: "exc_9")]
    let searchController = UISearchController(searchResultsController: nil)
    var requirements: Requirements!
    let serverResponseParser = ServerResponseParser()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        definesPresentationContext = true
        searchController.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        self.clearsSelectionOnViewWillAppear = false
        self.navigationItem.hidesBackButton = true
        refreshControl = UIRefreshControl()
        refreshControl!.addTarget(self, action: #selector(PlainTourTableViewController.refresh(sender:)), for: UIControlEvents.valueChanged)
        
        NotificationCenter.default.addObserver(self, selector: #selector(PlainTourTableViewController.receivedTourPackagesNotification(notification:)), name: NSNotification.Name(rawValue: "ReceivedTourPackages"), object: nil)
        refresh(sender: self)
    }
    
    func refresh(sender:AnyObject) {
        serverResponseParser.getTourPackages()
    }
    
    func receivedTourPackagesNotification(notification: NSNotification) {
        if let tourPackages = notification.userInfo?["tourPackages"] as? Array<TourPackage> {
            self.tourPackages = tourPackages
        }
        self.tableView.reloadData()
        refreshControl!.endRefreshing()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredTourPackages.count
        }
        return tourPackages.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "plainTourCell", for: indexPath) as! PlainTourTableViewCell
        let tourPackage: TourPackage
        if searchController.isActive && searchController.searchBar.text != "" {
            tourPackage = filteredTourPackages[indexPath.row]
        } else {
            tourPackage = tourPackages[indexPath.row]
        }
        cell.placeLabel?.text = tourPackage.excursion.place
        cell.datesLabel?.text = tourPackage.hotel.dateRange
        cell.tourNameLabel?.text = tourPackage.excursion.name
        cell.tourPriceLabel?.text = tourPackage.price
        cell.tourPictureImageView?.image = getImageAsync(url: tourPackages[indexPath.row].photoURL)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let destination = segue.destination as! DetailedTourTableViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                destination.tourPackage = tourPackages[indexPath.row]
            }
        } else if segue.identifier == "configureRequirements" {
            let destination = segue.destination as! RequirementsTableViewController
            destination.delegate = self
        }
    }
    
    func getImageAsync(url: String) -> UIImage {
        if let image = images[url] {
            return image
        } else {
            return #imageLiteral(resourceName: "placeholder")
        }
    }
    
    func filterContentForSearchText(searchText: String) {
        filteredTourPackages = tourPackages.filter({( tourPackage : TourPackage) -> Bool in
            return tourPackage.hotel.name.lowercased().contains(searchText.lowercased()) || tourPackage.excursion.name.lowercased().contains(searchText.lowercased()) || tourPackage.excursion.place.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
    func saveRequirements(_ requirements: Requirements) {
        self.requirements = requirements
    }
}

extension PlainTourTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
}
