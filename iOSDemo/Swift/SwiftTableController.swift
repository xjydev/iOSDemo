//
//  SwiftTableController.swift
//  iOSDemo
//
//  Created by XiaoDev on 17/05/2018.
//  Copyright © 2018 Xiaodev. All rights reserved.
//

import UIKit

class SwiftTableController: UITableViewController {
    let mainArray = [["title":"闭包","classn":"SwiftBlocksViewController","storyboard":"1"],["title":"枚举","classn":"EnumViewController","storyboard":"0"]]
    
    func fsunctionUseBlock(callBack:(String,String) ->String) -> Void {
    print(callBack("parameter1","parameter2"))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        var di = mainArray[0];
        print(di["title"]!);
        var a:String = "1"
        var b:String = "2"
        a = "12"
        b = "34"
        self.fsunctionUseBlock { (a, b) -> String in
            return b+a;
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mainArray.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "swiftcell", for: indexPath)
        let dict = mainArray[indexPath.row];
        
        cell.textLabel?.text = dict["title"];
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dict = mainArray[indexPath.row];
        guard let boolstr = dict["storyboard"] else { return };
        print(dict,boolstr)
        if (Int(boolstr) == 1){
            guard let Str = dict["classn"] else { return };
            self.performSegue(withIdentifier: Str, sender: nil);
        }
        else {
            guard let Str = dict["classn"] else { return };
            print(Str)
            let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String
            let classV = NSClassFromString(clsName! + "." +  "EnumViewController") as!UIViewController.Type;
            let vc = classV.init();
            self.navigationController?.pushViewController(vc, animated: true);
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
