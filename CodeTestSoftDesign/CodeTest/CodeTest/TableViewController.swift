//
//  ViewController.swift
//  CodeTest
//
//  Created by Rodrigo de Anhaia on 24/11/20.
//  Copyright © 2020 Rodrigo de Anhaia. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        updateEvent()
        
    }
    
    
    var events: [Event] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    func updateEvent() {
        NetworkManager().getEvent() { result in
            switch result {
            case let .success(events):
                self.events = events
            case let .failure(error):
                print(error)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return events.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! EventTableViewCell
        
        let event = events[indexPath.row]
            
        cell.event = event
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "GoToEventDetailSegue", sender: nil)
    }
    
    // Prepara as informações pra enviar para proxima View
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Variável que guarda a informação da cell/TableView
        guard let selectedPath = tableView.indexPathForSelectedRow else { return }
        // Variável que guarda o acesso a DetailsViewController
        let target = segue.destination as? DetailsViewController
        
        target?.configure(event: events[selectedPath.row])
        
        
        
    }
}
