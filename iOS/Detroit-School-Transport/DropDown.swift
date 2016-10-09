//
//  DropDown.swift
//  DemoDropDown
//
//  Created by Rahul Morade on 27/04/16.
//  Copyright © 2016 Rahul Morade. All rights reserved.
//

import UIKit


class DropDown: UIView ,UITableViewDataSource,UITableViewDelegate {

    
    var table: UITableView!
    var Selected: String?
    var DataArray:NSMutableArray=["First","Second","Third","Fourth","Fifth","Sixth","Seventh"]
    var AddArray:NSMutableArray=[]
    var GetArray:NSMutableArray=[]

    init(framea: CGRect, SetArray: NSMutableArray) {
        
        super.init(frame: CGRectMake(framea.origin.x, framea.origin.y+30, framea.size.width, framea.size.height))
        GetArray=SetArray
        DropDownViewSetup()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    func DropDownViewSetup (){
        table=UITableView()
        self.table.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.table.delegate      =   self
        self.table.dataSource    =   self
        self.table.allowsMultipleSelection = true
        self.addSubview(self.table)
        UIView.animateWithDuration(1.0, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2, options:UIViewAnimationOptions.TransitionNone, animations:
            { () -> Void in
             self.table.frame = CGRectMake(0, 0, self.frame.width, self.frame.height-30)
            },
            completion: {(finished:Bool) -> Void in
//                self.table.frame = CGRectMake(0, 0, self.frame.width, self.frame.height-30)
            })
        let OkBtn=UIButton()
        OkBtn.backgroundColor=UIColor.blackColor().colorWithAlphaComponent(0.1)
        OkBtn.frame=CGRectMake(0, self.frame.height-30, self.frame.width/2, 30)
        OkBtn.setTitle("OK", forState: .Normal)
        OkBtn.titleLabel?.textColor=UIColor.whiteColor()
        OkBtn.addTarget(self, action: "OkClicked", forControlEvents: .TouchUpInside)
        self.addSubview(OkBtn)
        let CancelBtn=UIButton()
        CancelBtn.backgroundColor=UIColor.blackColor().colorWithAlphaComponent(0.1)
        CancelBtn.frame=CGRectMake(self.frame.width/2, self.frame.height-30, self.frame.width/2, 30)
        CancelBtn.setTitle("Cancel", forState: .Normal)
        CancelBtn.titleLabel?.textColor=UIColor.whiteColor()
        CancelBtn.addTarget(self,action:"CancelClicked",forControlEvents:.TouchUpInside)
        self.addSubview(CancelBtn)
        self.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
//        self.table.select(selectedIndexPaths)
    }
    
    func OkClicked()
    {
        print("selected\(AddArray)")
//        let Vc = ViewController()
//        for element in AddArray {
//            Vc.output.text = element as? String
//        }
        self.removeFromSuperview()

    }
    
    func CancelClicked()
    {
        self.removeFromSuperview()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(GetArray.count==0){
        return DataArray.count;
        }
        else
        {
            return GetArray.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        if(GetArray.count==0){
            cell?.textLabel?.text=DataArray[indexPath.row] as? String
        }
        else
        {
            cell?.textLabel?.text=GetArray[indexPath.row] as? String
        }
        configure(tableView, cell:cell!,forRowAtIndexPath:indexPath)
                cell!.accessoryType=self.accessoryForIndexPath(indexPath)
        return cell!
    }
    
    var selectedIndexPaths = NSMutableSet()
    
    func configure(tableView: UITableView,cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if selectedIndexPaths.containsObject(indexPath) {
            // selected
            tableView.cellForRowAtIndexPath(indexPath)?.accessoryType=UITableViewCellAccessoryType.Checkmark
        }
        else {
            // not selected
            tableView.cellForRowAtIndexPath(indexPath)?.accessoryType=UITableViewCellAccessoryType.None
        }
    }
    
    func accessoryForIndexPath(indexPath: NSIndexPath) -> UITableViewCellAccessoryType {
        
        var accessory = UITableViewCellAccessoryType.None
        
        if selectedIndexPaths.containsObject(indexPath) {
            accessory=UITableViewCellAccessoryType.Checkmark
        }
        
        return accessory
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if selectedIndexPaths.containsObject(indexPath) {
            // deselect
            selectedIndexPaths.removeObject(indexPath)
            tableView.cellForRowAtIndexPath(indexPath)?.accessoryType=UITableViewCellAccessoryType.None
            if(GetArray.count==0){
            Selected=self.DataArray[indexPath.row] as? String
            AddArray.removeObject(Selected!)
            }else
            {
                Selected=self.GetArray[indexPath.row] as? String
                AddArray.removeObject(Selected!)
            }
        }
        else {
            // select
            selectedIndexPaths.addObject(indexPath)
            tableView.cellForRowAtIndexPath(indexPath)?.accessoryType=UITableViewCellAccessoryType.Checkmark
            if(GetArray.count==0){
            Selected=self.DataArray[indexPath.row] as? String
            AddArray.addObject(Selected!)
            }
            else
            {
                Selected=self.GetArray[indexPath.row] as? String
                AddArray.addObject(Selected!)
            }
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
       
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        Selected=self.DataArray[indexPath.row] as? String
        AddArray.removeObject(Selected!)
        tableView.cellForRowAtIndexPath(indexPath)?.accessoryType=UITableViewCellAccessoryType.None
    }
}
