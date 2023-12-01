//
//  NobelPrizeTableViewCell.swift
//  APIProject
//
//  Created by Ethan Archibald on 12/1/23.
//

import UIKit

class NobelPrizeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var motivationLabel: UILabel!
    
    var winner = PrizeWinner(firstName: "", surName: "", motivation: "")
    
    func updateUI(with prizeWinner: PrizeWinner) {
        self.winner = prizeWinner
        nameLabel.text = "\(winner.firstName) \(winner.surName)"
        motivationLabel.text = winner.motivation
    }
    
}
