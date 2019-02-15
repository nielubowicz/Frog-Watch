//
//  Frogs.swift
//  Frog Songs
//
//  Created by Chris Nielubowicz on 2/9/19.
//  Copyright © 2019 nielubowicz. All rights reserved.
//

import Foundation

func loadFrogs() throws -> [Frog] {
    guard let url = Bundle.main.url(forResource: "Frogs", withExtension: "plist") else { throw NSError(domain: "Frogs", code: 1, userInfo: ["description": "Error: No frog file found"]) }
    let data = try Data(contentsOf: url)
    let frogs = try PropertyListDecoder().decode([Frog].self, from: data)
    return frogs
}

class Frog: Codable {
    var name: String
    var call: String
    
    private enum CodingKeys: String, CodingKey {
        case name = "Name"
        case call = "Call"
    }

    var song: URL? {
        get {
            guard let value = Bundle.main.path(forResource: call, ofType: "mp3") else { return nil }
            return NSURL(fileURLWithPath: value) as URL
        }
    }
}
