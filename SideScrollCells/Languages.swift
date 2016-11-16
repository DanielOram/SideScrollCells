//
//  Languages.swift
//  SideScrollCells
//
//  Created by Daniel Oram on 16/11/16.
//  Copyright © 2016 Daniel Oram. All rights reserved.
//

import Foundation

//Localized for English only

class Languages {
    let alphabets: [Alphabet]!
    
    init() {
        alphabets = [Alphabet]()
        

    }
    
    
}

struct Alphabet {
    let name: String!
    let set: [Character]!
    
    init(forLanguage name: String, character set: [Character]) {
        self.name = name
        self.set = set
    }
    
    
    
}

struct Character {
    let char: String!
    
    init(_ character: String) {
        self.char = character
    }
}
