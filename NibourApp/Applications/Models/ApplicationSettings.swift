//
//  ApplicationSettings.swift
//  NibourApp
//
//  Created by Jacky So on 2018-06-05.
//  Copyright © 2018 Jacky So. All rights reserved.
//

import Foundation

struct ApplicationSettings {
    
    static let sharedInstance = ApplicationSettings()
    
    var appVersion: String {
        get { return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String }
    }
}

extension ApplicationSettings {
    
    func isSupported(minVersion: String) -> Bool {
        return (minVersion.compare(appVersion, options: .numeric) == .orderedDescending)
    }
}

extension ApplicationSettings {
    
    static let ApplicationSettingsInfoFileName = "ApplicationSettings"
    
    static let InfoKeyMinVersion = "min_version"
    
    static var defaultInfo: [String: NSObject]? {
        get { return Bundle.parsePlist(ofName: ApplicationSettings.ApplicationSettingsInfoFileName) as? [String : NSObject] }
    }
}
