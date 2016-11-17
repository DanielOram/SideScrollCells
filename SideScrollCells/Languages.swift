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
    
    static var sharedInstance = Languages()
//    static var sharedInstance: Languages {
//        get {
//            guard let existingData: Languages = self.sharedInstance else {
//                
//                let data = Settings.localisedData.object(forKey: "Data") as! NSDictionary
//                //let languages = data.object(forKey: "characterset") as! NSDictionary
//                
//                //process all language sets
//                for (key, values) in data {
//                    
//                    let characterData = values as! NSDictionary
//                    let alphabetString = characterData.object(forKey: "characterset")
//                    
//                    let language = alphabetString.characters.map{Character(String($0))}
//                    
//                    self.sharedInstance.alphabets.append(contentsOf: <#T##C#>)
//                }
//
//            }
//            return existingData
//        }
//        
//        //only set when language has changed
//        set() {
//            
//        }
//    }
    
    let alphabets: [Alphabet]!
    
    init() {
        alphabets = [Alphabet]()
        
        
        let data = Settings.localisedData.object(forKey: "Data") as! NSDictionary
        //let languages = data.object(forKey: "characterset") as! NSDictionary
        
        //process all language sets
        for (languageKey, values) in data {
            
            let characterData = values as! NSDictionary
            let alphabetString = characterData.object(forKey: "characterset") as! String
            print("language: \(languageKey), character set: \(alphabetString)")
            
            let characterSet = alphabetString.characters.map{Character(String($0))}
            
            alphabets.append(Alphabet(forLanguage: languageKey as! String, characters: characterSet ))
        }
        
        
        //add languages
        
        // - English
        
        let english: [Character] = "abcdefghijklmnopqrstuvwxyz".characters.map{Character(String($0))}
        
        alphabets.append(Alphabet(forLanguage: "English", characters: english))
    }
    
    
}

struct Alphabet {
    let name: String!
    let set: [Character]!
    
    init(forLanguage name: String, characters set: [Character]) {
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


//function for converting plist data to model - REDUNDANT forgot I declared global singleton

//func populateModel() -> [Languages]{
//    
//    let model = [Languages]()
//    
//    let data = Settings.localisedData.object(forKey: "Data") as! NSDictionary
//    //let languages = data.object(forKey: "characterset") as! NSDictionary
//    //process all language sets
//    for (language, values) in data {
//        
//        let characterData = values as! NSDictionary
//        let alphabetString = characterData.object(forKey: "characterset")
//        //model.append(Lan)
//    }
//    return model
//}
