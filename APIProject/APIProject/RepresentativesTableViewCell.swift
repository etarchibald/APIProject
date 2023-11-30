//
//  RepresentativesTableViewCell.swift
//  APIProject
//
//  Created by Ethan Archibald on 11/30/23.
//

import UIKit

class RepresentativesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet weak var standingLabel: UILabel!
    
    var myReper = Representative(name: "", party: "", link: "")
    
    func update(using myRep: Representative) {
        myReper = myRep
        nameLabel.text = myReper.name
        standingLabel.text = myReper.party
        linkLabel.text = myReper.link
    }
    
}
