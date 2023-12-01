//
//  NobelPeacePrizeTableViewController.swift
//  APIProject
//
//  Created by Ethan Archibald on 11/30/23.
//

import UIKit

class NobelPeacePrizeTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var nobelPrizeController = NobelPrizeController()
    
    var laureates = [Laureates]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getNobelPrizeWinners() {
        
        self.laureates = []
        self.tableView.reloadData()
        
        let searchYear = searchBar.text ?? ""
        
        if !searchYear.isEmpty {
            
            let yearQueryItem = URLQueryItem(name: "year", value: searchYear)
            
            Task {
                do {
                    let fetchedPrizeWinner = try await nobelPrizeController.fetchPrizeWinners(matching: [yearQueryItem])
                    self.laureates = fetchedPrizeWinner
                    self.tableView.reloadData()
                } catch {
                    print(error)
                }
            }
            
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return laureates.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return laureates[section].category
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return laureates[section].laureates.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nobelPeacePrize", for: indexPath) as! NobelPrizeTableViewCell
        
        
        for eachCatigory in laureates {
            for _ in eachCatigory.laureates {
                let nobelLaureates = laureates[indexPath.section]
                let winner = nobelLaureates.laureates[indexPath.row]
                cell.updateUI(with: winner)
            }
        }
        return cell
    }
     
}

extension NobelPeacePrizeTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        getNobelPrizeWinners()
    }
}
