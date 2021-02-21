//
//  NetworkManager.swift
//  saltside
//
//  Created by Siddhesh Redkar on 21/02/21.
//  Copyright © 2021 Siddhesh Redkar. All rights reserved.
//

import Foundation
import UIKit

enum HttpMethod:String{
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}


class NetworkManager {
    
    static let shared       = NetworkManager()
    let cache               = NSCache<NSString,UIImage>()
    
    private init() {}
    
    
    func getItemList(completed: @escaping (Result<ItemDetailList, SSErrors>) -> Void) {
        
        let endpoint = getItemListUrl()
        
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUrl))
            return
        }
        
        var request = URLRequest(url: url,timeoutInterval: Double.infinity)
        request.httpMethod = HttpMethod.get.rawValue
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let _ = error {
                completed(.failure(.unableToComplete))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
               // decoder.keyDecodingStrategy = .convertFromSnakeCase
                let response = try decoder.decode(ItemDetailList.self, from: data)
                completed(.success(response))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
 
    
     
    
}


