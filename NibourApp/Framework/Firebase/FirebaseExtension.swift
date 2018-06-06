//
//  Firebase+Enum.swift
//  NibourApp
//
//  Created by Jacky So on 2018-06-05.
//  Copyright © 2018 Jacky So. All rights reserved.
//

import Foundation
import Firebase

extension FirebaseApp {
    
    static let ConfigInfoFileName = "GoogleService-Info"
    
    enum InfoKey: String {
        case ClientId = "CLIENT_ID"
    }
    
    static func getInfoValue(infoKey: InfoKey) -> String? {
        guard let dict = Bundle.parsePlist(ofName: FirebaseApp.ConfigInfoFileName) else {
            return nil
        }
        return dict[infoKey.rawValue] as? String
    }
}
