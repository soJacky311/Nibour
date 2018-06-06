//
//  BundleExtension.swift
//  NibourApp
//
//  Created by Jacky So on 2018-06-05.
//  Copyright © 2018 Jacky So. All rights reserved.
//

import Foundation

extension Bundle {
    
    /// A functions to parse the plist and return the dictionary
    ///
    /// - Parameter name: Plist file name
    /// - Returns: Dictionary key value pair fo the plist
    static func parsePlist(ofName name: String) -> [String: AnyObject]? {
        
        // check if plist data available
        guard let plistURL = Bundle.main.url(forResource: name, withExtension: "plist"),
            let data = try? Data(contentsOf: plistURL)
            else {
                return nil
        }
        
        // parse plist into [String: Anyobject]
        guard let plistDictionary = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: AnyObject] else {
            return nil
        }
        
        return plistDictionary
    }
}
