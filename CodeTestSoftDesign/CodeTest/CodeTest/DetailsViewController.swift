//
//  DetailsViewController.swift
//  CodeTest
//
//  Created by Rodrigo de Anhaia on 26/11/20.
//  Copyright © 2020 Rodrigo de Anhaia. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageEvent: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dateLavel: UILabel!
    @IBOutlet weak var textField: UITextView!
 
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = event.title
        dateLavel.text = event.formattedDate
        priceLabel.text = event.formattedPrice
        textField.text = event.description
        
        if let imageString = event.image {
            downloadImage(from: URL(string: imageString)!)
        }
        
    }
    var event: Event!
    
    func configure(event: Event) {
        self.event = event
    }
    
    func downloadImage(from url: URL) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() { [weak self] in
                self?.imageEvent.image = UIImage(data: data)
            }
        }
    }
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
