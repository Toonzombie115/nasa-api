//
//  URLtoImageSessionWorker.swift
//  NASA-API-MVC
//
//  Created by Paco Arvizu on 27/05/25.
//

import Foundation
import UIKit
extension UIImageView{
    func loadImg(url: String){
        let mediaURL = URL(string: url)
        DispatchQueue.global().async {
            [weak self] in
            if let data = try? Data(contentsOf: mediaURL!){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
