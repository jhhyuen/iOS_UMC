//
//  Channel.swift
//  UMC_MiniProject
//
//  Created by Jinyoung Leem on 6/17/24.
//

import Foundation

struct Channel {
    var id: String?
    let name: String
    
    init(id: String? = nil, name: String){
        self.id = id
        self.name = name
    }
}

extension Channel: Comparable {
    static func == (lhs:Channel, rhs: Channel) -> Bool {
        return lhs.id == rhs.id
    }
    
    static func < (lhs: Channel, rhs:Channel) -> Bool {
        return lhs.name < rhs.name
    }
}
