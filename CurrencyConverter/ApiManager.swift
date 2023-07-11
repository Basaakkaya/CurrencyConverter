//
//  ApiManager.swift
//  CurrencyConverter
//
//  Created by Başak Kaya on 10.07.2023.
//

import Foundation

class ApiManager {
    func fetchCurrencyData(onSuccess: @escaping(Dictionary<String, Any>) -> Void, onError: @escaping(String) -> Void) {
        
        // 1) Request & Session
        // 2) Response & Data
        // 3) Parsing & JSON Serialization
        
        //1.
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=82aba9cc6c0e20e54fb78527fe063b6e")
        
        let session = URLSession.shared
        
        //Closure
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                onError(error!.localizedDescription)
            } else {
                // 2.
                if data != nil {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        //ASYNC
                        DispatchQueue.main.async {
                        onSuccess(jsonResponse)
                            
                        }
                        
                    } catch {
                        onError(error.localizedDescription)
                    }
                }
            }
        }
        task.resume()
    }
    
}

