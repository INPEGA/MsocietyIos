/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit
class HomeController: RTPagingViewController {
      
    //@IBOutlet weak var myView: UIView!
    //var pageMenu : CAPSPageMenu?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWidget()
        
    }
   func setupWidget() {
            // Array to keep track of controllers in page menu
        var controllerArray : [UIViewController] = []
    
        self.title = "M-Society"
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc1:ListController = storyboard.instantiateViewControllerWithIdentifier("ListController") as! ListController
        let vc2:MapController = storyboard.instantiateViewControllerWithIdentifier("MapController") as! MapController
    
        vc1.title = "รายชื่อพม.จังหวัด"
        vc2.title = "แผนที่ตั้ง"
    
 
        controllerArray.append(vc1)
        controllerArray.append(vc2)
    
        let indicator = UIView(frame: CGRect(x: 0,y: 0,width: self.view.bounds.width/2,height: 4))
        var frame: CGRect = self.view.frame
        frame.size.height = 400
    
        indicator.backgroundColor = Theme.PageMenu.selectionIndicatorColor
        indicator.autoresizingMask = UIViewAutoresizing.FlexibleBottomMargin
        self.titleIndicatorView = indicator
        self.view.backgroundColor = Theme.PageMenu.backgroundColor
        self.controllers = [vc1,vc2]
        self.titleFont =  UIFont(name: "THSarabunNew", size: 15.0)!
        self.titleColor = UIColor.whiteColor()
        self.titleView.sizeToFit()
        self.selectedTitleColor =  UIColor(red: 124, green:255, blue:0, alpha: 1.0)
    
        self.currentControllerIndex = 0

    
        /*
        // Customize page menu to your liking (optional) or use default settings by sending nil for 'options' in the init
        // Example:
        let parameters: [CAPSPageMenuOption] = [
            .ScrollMenuBackgroundColor(Theme.PageMenu.backgroundColor),
            .ViewBackgroundColor( UIColor.whiteColor()),
            .SelectionIndicatorColor(Theme.PageMenu.selectionIndicatorColor),
            .AddBottomMenuHairline(false),
            //.CenterMenuItems(true),
            .MenuItemFont(UIFont(name: "THSarabunNew-Bold", size: 15.0)!),
            .UseMenuLikeSegmentedControl(true),
            .MenuHeight(50.0),
            
            .MenuItemSeparatorWidth(0.0),
            .MenuItemSeparatorPercentageHeight(0.0),
            
            //.MenuItemSeparatorPercentageHeight(0.1),
            .SelectionIndicatorHeight(3.0),
            //.MenuItemSeparatorWidth(4.3),
            .MenuItemWidthBasedOnTitleTextWidth(true),
            .SelectedMenuItemLabelColor(Theme.PageMenu.SelectedMenuItemLabelColor)
        ]
        
        // Initialize scroll menu
    
        let topMargin:CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height+self.navigationController!.navigationBar.frame.size.height;
    
        //pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, topMargin, self.view.frame.width, self.view.frame.height-topMargin), pageMenuOptions: parameters)
        //let pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
        //self.pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 64.0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height-64.0), pageMenuOptions: parameters)
        //pageMenu = CAPSPageMenu(viewControllers: [vc1, vc2], frame: view.bounds, pageMenuOptions: parameters)
    
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0,topMargin, self.view.frame.width,self.view.frame.height), pageMenuOptions: parameters)
        //self.addChildViewController(pageMenu!)
        self.addChildViewController(pageMenu!)
        pageMenu?.hideTopMenuBar = true
        //pageMenu!.view.frame = self.view.bounds // modify this line as you like
        //pageMenu!.view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight] // modify this line as
        self.view.addSubview(pageMenu!.view)
        pageMenu!.didMoveToParentViewController(self)
        
        //self.pageMenu!.delegate = self
        //self.view.addSubview(pageMenu!.view)
        //pageMenu!.didMoveToParentViewController(self)
        //self.addChildViewController(pageMenu!)
    
        //self.myView.addSubview(pageMenu.view)
        //self.addChildViewController(pageMenu!)
        //self.view.addSubview(pageMenu.view)
        //pageMenu!.didMoveToParentViewController(self)
        */
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
