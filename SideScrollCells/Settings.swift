//
//  Settings.swift
//  SideScrollCells
//
//  Created by Daniel Oram on 18/11/16.
//  Copyright © 2016 Daniel Oram. All rights reserved.
//

import Foundation

class Settings {
    
    static let defaults = UserDefaults.standard
    
    struct Keys {
        static let SETTINGS_LANGUAGE = "settings_language"
    }
    
    //the set language to localise for
    
    static var settingsLanguage: String {
        get {
            return defaults.string(forKey: self.Keys.SETTINGS_LANGUAGE)!
        }
        
        set(language) {
            defaults.set(language, forKey: self.Keys.SETTINGS_LANGUAGE)
        }
    }
    
    
}





