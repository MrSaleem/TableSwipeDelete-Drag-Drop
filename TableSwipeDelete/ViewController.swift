//
//  ViewController.swift
//  TableSwipeDelete
//
//  Created by MdSaleem on 07/03/16.
//  Copyright © 2016 Rootinfosol. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    private var rows: Array<UITableViewCell> = []
    
    let greenColor = UIColor(red: 85.0/255, green: 213.0/255, blue: 80.0/255, alpha: 1)
    let redColor = UIColor(red: 213.0/255, green: 70.0/255, blue: 70.0/255, alpha: 1)
    let yellowColor = UIColor(red: 236.0/255, green: 223.0/255, blue: 60.0/255, alpha: 1)
    let brownColor = UIColor(red: 182.0/255, green: 127.0/255, blue: 78.0/255, alpha: 1)

    var array:Array = ["APPLE","SAMSUNG","SONY","NOKIA","BLACKBERRY","LAVA","HUVAWAI"]
    var removeCellBlock: ((SBGestureTableView, SBGestureTableViewCell) -> Void)!

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor.yellowColor().colorWithAlphaComponent(0.7)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as? CustomTableViewCell
        cell?.cellLabel.text = array[indexPath.row]
        cell?.textLabel?.textColor = UIColor.redColor()
        cell?.backgroundColor = UIColor.yellowColor().colorWithAlphaComponent(0.7)
        let swipeRight: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.callYourMehod(_:)))
        swipeRight.direction = .Right
        self.tableView.addGestureRecognizer(swipeRight)
        return cell!
    }
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let acceptAction = UITableViewRowAction(style: .Normal, title: "        ") {action, index in
             print("Accept")
            let alert = UIAlertController(title: "HELLO", message: "Accept Action Call", preferredStyle: .Alert)
            self.presentViewController(alert, animated: true, completion: nil)
            alert.addAction(UIAlertAction(title: "OKAY", style: .Destructive, handler: {
                (alert:UIAlertAction!) in
                //****//
                // ***//
                //And then remove object from tableview
            }))

        }
        acceptAction.backgroundColor = UIColor(patternImage: UIImage(named: "AcceptA")!)
        let blockAction = UITableViewRowAction(style: .Default, title: "        ") {action, index  in
            print("Block")
            let alert = UIAlertController(title: "HELLO", message: "Block Action Call", preferredStyle: .Alert)
            self.presentViewController(alert, animated: true, completion: nil)
            alert.addAction(UIAlertAction(title: "OKAY", style: .Destructive, handler: {
                (alert:UIAlertAction!) in
                //****//
                // ***//
                //And then remove object from tableview
            }))

            
        }
        blockAction.backgroundColor = UIColor(patternImage: UIImage(named: "Block")!)
        let declineAction = UITableViewRowAction(style: .Default, title: "        ") {action, index in
            print("Decline")
            let alert = UIAlertController(title: "HELLO", message: "Decline Action Call", preferredStyle: .Alert)
            self.presentViewController(alert, animated: true, completion: nil)
            alert.addAction(UIAlertAction(title: "OKAY", style: .Destructive, handler: {
                (alert:UIAlertAction!) in
                //****//
                // ***//
                //And then remove object from tableview
            }))

        }
        declineAction.backgroundColor = UIColor(patternImage: UIImage(named: "DeclineA")!)
        
        return [blockAction,declineAction,acceptAction]
    }
    
    
    
     func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let alert = UIAlertController(title: "", message: "Are you sure you want to delete this cell?", preferredStyle: .ActionSheet)
            
            alert.addAction(UIAlertAction(title: "Yes", style: .Destructive, handler: {
                (alert:UIAlertAction!) in
                //****//
                // ***//
                //And then remove object from tableview
                self.array.removeAtIndex(indexPath.row)
                self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }))
           
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
//      SwipE Action
       func callYourMehod(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .Right) {
            
            
            
            
            
let alert = UIAlertController(title: "HELLO", message: "Are you sure you want to delete this cell?", preferredStyle: .Alert)
            self.presentViewController(alert, animated: true, completion: nil)
            alert.addAction(UIAlertAction(title: "Done", style: .Destructive, handler: {
                (alert:UIAlertAction!) in
                //****//
                // ***//
                //And then remove object from tableview
                           }))

        }
    }

}