//
//  Contact.swift
//  Msociety
//
//  Created by Peerapun Sangpun on 6/28/2559 BE.
//  Copyright © 2559 Peerapun Sangpun. All rights reserved.
//

import RealmSwift // [1]

class Contact: Object { // [2]
    dynamic var name = ""
    dynamic var telephone = ""
    dynamic var address = ""
    dynamic var sub_district = ""
    dynamic var district = ""
    dynamic var province = ""
    dynamic var postcode = ""
    dynamic var email = ""
    dynamic var fax = ""
    dynamic var url = ""
    dynamic var latitude: Double = 0.0
    dynamic var longitude: Double = 0.0
    dynamic var distance = ""
}