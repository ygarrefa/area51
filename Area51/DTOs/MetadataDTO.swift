//
//  MetadataDTO.swift
//  Area51
//
//  Created by Alex Garrefa on 21/02/2019.
//

import Foundation

struct MetadataDTO: Codable {
    let code: Int
    let requestId: String
    let errorType: String?
    let errorDetail: String?
}
