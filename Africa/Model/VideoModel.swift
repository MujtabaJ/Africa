//
//  VideoModel.swift
//  Africa
//
//  Created by a on 11/21/21.
//

import Foundation

struct Videos: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    //: Computing Property
    var thumbnail: String {
        "video-\(id)"
    }
}
