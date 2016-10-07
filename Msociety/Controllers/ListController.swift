//
//  NearByController.swift
//  Swift-Base
//
//  Created by Peerapun Sangpun on 5/15/2559 BE.
//  Copyright © 2559 Flatstack. All rights reserved.
//

import UIKit
import RealmSwift

class PropertyCell: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}



class ListController  :  UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {
   
    var contacts:Results<Contact>?
    var filtered:Results<Contact>?
    var data: NSArray?
    var searchActive : Bool = false
    @IBOutlet weak var tableView: UITableView!
    var resultSearchController = UISearchController()

    //@IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.hideKeyboardWhenTappedAround()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        //searchBar.delegate = self
        
        do {
            let realm = try Realm()
            contacts = realm.objects(Contact)
        } catch let error as NSError {
            // handle error
        }

        if #available(iOS 9.0, *) {
            self.resultSearchController.loadViewIfNeeded()// iOS 9
        } else {
            // Fallback on earlier versions
            let _ = self.resultSearchController.view          // iOS 8
        }
        
        self.resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.hidesNavigationBarDuringPresentation = true
            controller.dimsBackgroundDuringPresentation = false
            
            
            controller.searchBar.searchBarStyle = .Minimal
            controller.searchBar.sizeToFit()
            controller.searchResultsUpdater = self
            self.tableView.tableHeaderView = controller.searchBar
            return controller
        })()
        self.tableView.reloadData()
        
    }
 
   
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
        if searchController.searchBar.text?.characters.count > 0 {
            
            let predicate = NSPredicate(format: "name CONTAINS [c]%@", searchController.searchBar.text!);
            do {
                filtered = try Realm().objects(Contact).filter(predicate).sorted("name", ascending: true)
            } catch {
                
            }
            
        }
        else {
              filtered = contacts
        }
       self.tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
 
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.resultSearchController.active {
            return filtered!.count
        }
        return (contacts?.count)!;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyTestCell")
        let cell = tableView.dequeueReusableCellWithIdentifier("TableCell", forIndexPath: indexPath) as! PropertyCell
         let contact: Contact?
        if(self.resultSearchController.active){
            contact = filtered![indexPath.row] as Contact
        } else {
            contact = contacts![indexPath.row] as Contact
        }
        
        //let contact: Contact = self.data![indexPath.row] as! Contact
        cell.lblTitle?.text =  String(contact!.name)
        cell.lblDescription?.text = contact!.address
        return cell
    }
 
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if  segue.identifier == "goDetail" {
            let destination = segue.destinationViewController as? DetailController
            let contact: Contact?
            let  index = tableView.indexPathForSelectedRow?.row
            if(self.resultSearchController.active){
                contact = filtered![index!] as Contact
            } else {
                contact = contacts![index!] as Contact
            }
            destination?.contact = contact
        }
    }
}

