//
//  APODRepository.swift
//  NASA-API-MVC
//
//  Created by Paco Arvizu on 27/05/25.
//

import Foundation
import UIKit

class APODRepository{
    let url: String
    let urlWorker: APODURLSessionWorker
    let key: String
    init(){
        url = "https://api.nasa.gov/planetary/apod"
        key = "QCWKlUao6Soo0d3oVT5K7FUtlvlw5ssSFQuZEa30"
        urlWorker = APODURLSessionWorker()
    }
    
    func fetchAPOD(completion: @escaping(APODResponse) -> Void){
        
        let url = url + "?api_key=" + key
        
        urlWorker.get(url: url){ [weak self] (result: Result<APODResponse, Error>) in
            switch result{
            case .success(let response):
                completion(response)
                break
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

