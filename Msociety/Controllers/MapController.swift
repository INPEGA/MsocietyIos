//
//  MapController.swift
//
//
//  Created by Peerapun Sangpun on 3/15/2559 BE.
//  Copyright © 2559 Peerapun Sangpun. All rights reserved.
//

import UIKit
import RealmSwift


class MapController: UIViewController ,CLLocationManagerDelegate ,GMSMapViewDelegate {
    
    var locationManager = CLLocationManager()
    var contacts:Results<Contact>?
    @IBOutlet var mapView: GMSMapView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }

       
        let camera = GMSCameraPosition.cameraWithLatitude(16.885251, longitude: 99.126506, zoom: 5)
        let mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.myLocationEnabled = true
        mapView.delegate = self
        //                self.view = mapView
        self.view = mapView
        
        /*
        
        */
    
        do {
            contacts =  try Realm().objects(Contact)
         
            
        } catch _ as NSError {
            // handle error
        }
        
        
        var longitude: CLLocationDegrees!
        var latitude: CLLocationDegrees!
        
        for   contact in contacts! {
            //addMarker(contact.name,latitude: contact.latitude,longitude: contact.longitude)
            //print("contact:\(contact.latitude)")
          
            longitude = contact.longitude
            latitude = contact.latitude
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2DMake(longitude ,latitude)
            marker.title = contact.name
            marker.snippet = contact.address
            marker.icon = UIImage(named: "marker")
            marker.map = mapView
            marker.userData = contact
        }
        
        

        //loadMap(13.6744682,longitude:100.4678154)
    }
    
    func mapView(mapView: GMSMapView!, didTapInfoWindowOfMarker marker: GMSMarker) {
        
        let contact:Contact = marker.userData as! Contact
        let latitude:String = String(contact.latitude)
        let longitude:String = String(contact.longitude)
        if (UIApplication.sharedApplication().canOpenURL(NSURL(string:"comgooglemaps://")!)) {
            UIApplication.sharedApplication().openURL(NSURL(string:
                "comgooglemaps://?q=\(longitude),\(latitude)&zoom=14&views=traffic")!)
        } else {
            print("Can't use comgooglemaps://");
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}