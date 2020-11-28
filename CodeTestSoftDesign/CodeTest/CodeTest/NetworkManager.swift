//
//  NetworkManager.swift
//  CodeTest
//
//  Created by Rodrigo de Anhaia on 25/11/20.
//  Copyright © 2020 Rodrigo de Anhaia. All rights reserved.
//

import Foundation

class NetworkManager {
    
    // shared singleton session object used to run tasks. Will be useful later
    let urlSession = URLSession.shared
    
    var baseURL = "http://5f5a8f24d44d640016169133.mockapi.io/api/events"
    
    
    func getEvent(completion: @escaping ((Result<[Event]>) -> Void)) {
        // API query
        let query  = baseURL
        
        // Add the baseURL to it
        let fullURL = URL(string: baseURL)!
       
        // Creat the Request
        var request = URLRequest(url: fullURL)
        
        
        let task = urlSession.dataTask(with: request) { data, response, error in
            // error check/handling
            if let error = error{
                
                print(error.localizedDescription)
            }
            
            // make sure we get back data
            guard let data = data else {
                return
    
            }
            
//            print(String(data: data, encoding: .utf8))
            // Decode the API response into our PostList object that we can use/interact with
            guard let result = try? JSONDecoder().decode([Event].self, from: data) else {
                return
            }
            
            let events = result
            
            // Return the result with the completion handler
            DispatchQueue.main.async {
                completion(Result.success(events))
                                }
        }
        task.resume()
    }
}


