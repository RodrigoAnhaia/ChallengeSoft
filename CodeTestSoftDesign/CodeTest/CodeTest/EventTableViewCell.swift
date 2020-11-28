//
//  EventTableViewCell.swift
//  CodeTest
//
//  Created by Rodrigo de Anhaia on 26/11/20.
//  Copyright © 2020 Rodrigo de Anhaia. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var event: Event? {
        didSet {
            
            guard let event = event	else { return }
            titleLabel.text = event.title
            priceLabel.text = event.formattedPrice
            
            
            dateLabel.text = event.formattedDate
            
        }
    }
}
