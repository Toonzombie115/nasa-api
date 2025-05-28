//
//  APODURLSessionWorker.swift
//  NASA-API-MVC
//
//  Created by Paco Arvizu on 27/05/25.
//

import Foundation
class APODURLSessionWorker{
    func get(url: String, completion: @escaping(Result<APODResponse, Error>)-> Void){
        
        //1 URLREQUEST
        
        guard let aURL: URL = URL(string: url) else {
            let error = NSError(domain: "Fatal Error", code: 666, userInfo: nil)
            completion(.failure(error as Error))
            return
        }
        var request: URLRequest = URLRequest(url: aURL)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        
        
        //2 URLSession
        
        let urlSession: URLSession = URLSession(configuration: URLSessionConfiguration.default)
        
        //3 Dispatch
        
        DispatchQueue.global(qos: .userInteractive).async {
        
        //4 Completion
        let task = urlSession.dataTask(with: request){[weak self](data: Data?, urlResponse: URLResponse?, error: Error?) in guard let _ = self ,let httpResponse: HTTPURLResponse = urlResponse as? HTTPURLResponse else {
                let error = NSError(domain: "Fatal Error", code: 666, userInfo: nil)
                completion(.failure(error as Error))
                return
                }
            
            switch httpResponse.statusCode{
                case 200...299:
                guard let aData: Data = data else {
                    let error = NSError(domain: "Fatal Error", code: 666, userInfo: nil)
                    completion(.failure(error as Error))
                    return
                    }
                do {
                    let response: APODResponse = try JSONDecoder().decode(APODResponse.self, from: aData)
                    completion(.success(response))
                    }
                catch let error {
                    completion(.failure(error))
                    }
                default:
                    let error = NSError(domain: "Fatal Error", code: 666, userInfo: nil)
                    completion(.failure(error as Error))
                    return
                }
            }
            task.resume()
        }
    }
}
