//
//  Service.swift
//  Where is Your Name From
//
//  Created by Pedro Boga on 29/10/21.
//

import Foundation

class Service {
    let url = "https://api.nationalize.io/"
    
    func getNameInfo(with name: String, completion: @escaping (Name) -> Void) {
        guard let url = URL(string: "\(url)?name=\(name)") else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error { return }
            
            if let data = data {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let decode = try jsonDecoder.decode(Name.self, from: data)
                    DispatchQueue.main.async {
                        completion(decode)
                    }
                } catch {
                    print(error)
                }
            }
        }
        dataTask.resume()
    }
    
}
