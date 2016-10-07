//
//  DetailController.swift
//  Msociety
//
//  Created by Peerapun Sangpun on 7/14/2559 BE.
//  Copyright © 2559 Peerapun Sangpun. All rights reserved.
//
//
//  DetailController.swift
//  Researchcoatal
//
//  Created by Peerapun Sangpun on 7/10/2559 BE.
//  Copyright © 2559 Peerapun Sangpun. All rights reserved.
//

import UIKit
class DetailCell: UITableViewCell {
    
 
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var labelDetail: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}


class DetailController: UITableViewController {
    
    var contact: Contact!
    var data = [DataInfo]()
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("obj\(research)")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        do {
            
            
            
            
            data = [
                DataInfo(title: "ชื่อหน่วยงาน", subtitle: contact.name),
                DataInfo(title: "ที่ตั้ง", subtitle:  contact.address),
                DataInfo(title: "ตำบล", subtitle:  contact.sub_district),
                DataInfo(title: "อำเภอ", subtitle:  contact.district),
                DataInfo(title: "จังหวัด", subtitle:  contact.province),
                DataInfo(title: "รหัสไปรษณีย์", subtitle:  contact.postcode),
                DataInfo(title: "อีเมล", subtitle: contact.email),
                DataInfo(title: "โทรศัพท์", subtitle:  contact.telephone),
                DataInfo(title: "โทรสาร", subtitle:  contact.fax),
                DataInfo(title: "เวปไซด์", subtitle:  contact.url),
                
            ]
            
        }
        catch let error as NSError {
            print("Error is: \(error)")
        }
        //tableView.estimatedRowHeight = 89
        //tableView.rowHeight = UITableViewAutomaticDimension
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! DetailCell
        cell.labelText.text=data[indexPath.row].title
        cell.labelText.textColor = Theme.NavigationBar.barTint
        cell.labelDetail?.text = data[indexPath.row].subtitle
        cell.accessoryType = .None
        if indexPath.row == 6 || indexPath.row == 7 || indexPath.row == 9 {
            
            cell.accessoryType = .DisclosureIndicator;
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        
        if indexPath.row == 6 { //email
            
            if let url = NSURL(string: "mailto:\(data[indexPath.row].subtitle)") {
                let application = UIApplication.sharedApplication()
                if application.canOpenURL(url) {
                    application.openURL(url)
                }
                else{
                    alert("Cannot send mail!")
                }
            }
            
            
        } else if indexPath.row == 7 { //telephone
            if let url = NSURL(string: "tel:\(data[indexPath.row].subtitle)") {
                let application = UIApplication.sharedApplication()
                if application.canOpenURL(url) {
                    application.openURL(url)
                }
                else{
                    alert("Cannot call phone!")
                }
            }
            
        } else if indexPath.row == 9 {//website
            if let url = NSURL(string: "http://\(data[indexPath.row].subtitle)") {
                let application = UIApplication.sharedApplication()
                if application.canOpenURL(url) {
                    application.openURL(url)
                }
                else{
                    alert("Cannot open website!")
                }
            }
             
        }

        
        
    }
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
        
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }
    
}
