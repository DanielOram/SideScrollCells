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
    static var localisedData: NSArray?
    
    struct Keys {
        static let SETTINGS_LANGUAGE = "settings_language"
    }
    
    //the set language to localise for
    
    static var settingsLanguage: String {
        get {
            //check language has been set TODO: - prompt user for language!
            guard let language: String = defaults.string(forKey: self.Keys.SETTINGS_LANGUAGE) else {
                //prompt user to select language
                
                //return english for now
                return "English"
            }
            return language
        }
        
        set(language) {
            defaults.set(language, forKey: self.Keys.SETTINGS_LANGUAGE)
        }
    }
    
    //load localised strings file
    
    func loadLocalisedLanguage() {
        
        let localisedDataPath = Bundle.main.path(forResource: Settings.settingsLanguage, ofType: "plist")
        Settings.localisedData = NSArray(contentsOfFile: localisedDataPath!)
    }
    
    
}





