//
//  AppDelegate.swift
//  Msociety
//
//  Created by Peerapun Sangpun on 6/26/2559 BE.
//  Copyright © 2559 Peerapun Sangpun. All rights reserved.
//

import UIKit
import RealmSwift
import SwiftCSV
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
 
    let googleMapsApiKey = "AIzaSyAseQvSCAqcbNZIgxGL_XOjsPXXBp0upK8"
   
 
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        //let types: UIUserNotificationType = [UIUserNotificationType.Badge, UIUserNotificationType.Alert, UIUserNotificationType.Sound]
        //let settings: UIUserNotificationSettings = UIUserNotificationSettings( forTypes: types, categories: nil )
        //application.registerUserNotificationSettings( settings )
        //application.registerForRemoteNotifications()
        GMSServices.provideAPIKey(googleMapsApiKey)
         
        //init data
        let config = Realm.Configuration(
            // Set the new schema version. This must be greater than the previously used
            // version (if you've never set a schema version before, the version is 0).
            schemaVersion: 1,
            
            // Set the block which will be called automatically when opening a Realm with
            // a schema version lower than the one set above
            migrationBlock: { migration, oldSchemaVersion in
                // We haven’t migrated anything yet, so oldSchemaVersion == 0
                if (oldSchemaVersion < 1) {
                    // Nothing to do!
                    // Realm will automatically detect new properties and removed properties
                    // And will update the schema on disk automatically
                }
        })
        Realm.Configuration.defaultConfiguration = config
        let contacts:Results<Contact> = try! Realm().objects(Contact.self)
        if(contacts.count==0) {
            init_data()
        }
        return true
    }
    
    func init_data() {
        
        do {
            let realm = try Realm()
            try! realm.write {realm.deleteAll()}
            let csv = try CSV(name: NSBundle.mainBundle().pathForResource("data", ofType: "csv")!)
            
            csv.enumerateAsDict { dict in
                
                let contact = Contact()
                contact.name = dict["provinceOffice"]! as String
                contact.address = dict["address"]! as String
                contact.sub_district = dict["subdistrict"]! as String
                contact.district = dict["district"]! as String
                contact.province = dict["province"]! as String
                contact.postcode = dict["postcode"]! as String
                contact.email = dict["email"]! as String
                contact.telephone = dict["telephone"]! as String
                contact.fax = dict["fax"]! as String
                contact.url = dict["URL"]! as String
                contact.latitude = Double(dict["latitude"]!)!
                contact.longitude = Double(dict["longtitude"]!)!
                try! realm.write {
                    realm.add(contact)
                }
            }
           
        } catch _ as NSError {
            // handle error
        }
        
    }
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}
