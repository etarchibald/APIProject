//
//  RepresentativesTableViewController.swift
//  APIProject
//
//  Created by Ethan Archibald on 11/30/23.
//

import UIKit

@MainActor
class RepresentativesTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    let RepController = RepresentativesController()
    
    var representatives = [Representative]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func getMyRep() {
        
        self.representatives = []
        self.tableView.reloadData()
        
        let searchZip = searchBar.text ?? ""
        
        if !searchZip.isEmpty {
           
            let zipQueryItem = URLQueryItem(name: "zip", value: searchZip)
            let jsonQueryItem = URLQueryItem(name: "output", value: "json")
            
            Task {
                do {
                    let fetchedItems = try await RepController.fetchItems(matching: [zipQueryItem, jsonQueryItem])
                    self.representatives = fetchedItems
                    print(representatives)
                    tableView.reloadData()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return representatives.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Rep", for: indexPath) as! RepresentativesTableViewCell
        
        let myRep = representatives[indexPath.row]
        
        cell.update(using: myRep)

        return cell
    }
    

}

extension RepresentativesTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        getMyRep()
    }
}
