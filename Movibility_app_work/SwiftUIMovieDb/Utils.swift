//
//  Utils.swift
//  Movibility_app
//
//  Created by shomokh aldosari on 26/03/1445 AH.
//

import Foundation
class Utils {
    static let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .formatted(dataFormatter)
        return jsonDecoder
    }()
    
    static let dataFormatter: DateFormatter = {
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "yyyy-mm-dd"
        return dataFormatter
    }()
}
