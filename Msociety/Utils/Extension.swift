//
//  Extension.swift
//  Msociety
//
//  Created by Peerapun Sangpun on 7/2/2559 BE.
//  Copyright © 2559 Peerapun Sangpun. All rights reserved.
//

import Foundation
extension UIViewController {
    
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let OKAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(OKAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
}

