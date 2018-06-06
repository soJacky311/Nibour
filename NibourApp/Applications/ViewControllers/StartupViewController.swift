//
//  StartupViewController.swift
//  NibourApp
//
//  Created by Jacky So on 2018-06-05.
//  Copyright © 2018 Jacky So. All rights reserved.
//

import UIKit
import Firebase

class StartupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRemoteConfigDefaults()
        fetchRemoteConfig()
    }

    func setRemoteConfigDefaults() {
        RemoteConfig.remoteConfig().setDefaults(ApplicationSettings.defaultInfo)
    }
    
    func fetchRemoteConfig() {
        // FIXME: Remove this before going on production!!
        let debugSettings = RemoteConfigSettings(developerModeEnabled: true)
        RemoteConfig.remoteConfig().configSettings = debugSettings
        
        RemoteConfig.remoteConfig().fetch(withExpirationDuration: 0) { [unowned self] (status, error) in
            guard error == nil else {
                print("Oh-no. Got an error")
                self.processStartupFlow()
                return
            }
            print("Hooray! Retrieved values from the cloud!")
            RemoteConfig.remoteConfig().activateFetched()
            
            self.checkApplication()
        }
    }
    
    func checkApplication() {
        guard
            let minVersion = RemoteConfig.remoteConfig().configValue(forKey: ApplicationSettings.InfoKeyMinVersion).stringValue,
            ApplicationSettings.sharedInstance.isSupported(minVersion: minVersion) == false else {
            displayForceUpgradeAlert()
            return
        }
        processStartupFlow()
    }
    
    func displayForceUpgradeAlert() {
        let alert = UIAlertController(title: "New Update Available!", message: "Please update the application to the latest version.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func processStartupFlow() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
