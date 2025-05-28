//
//  APODResponse.swift
//  NASA-API-MVC
//
//  Created by Paco Arvizu on 27/05/25.
//

import Foundation

struct APODResponse: Codable{
    let copyright: String?
    let date: String
    let explanation: String
    let hdurl: String?
    let media_type: String
    let title: String
    let url: String
}
