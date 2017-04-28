//
//  StatisticsTableViewController.swift
//  SpeedTest
//
//  Created by sce on 4/28/17.
//  Copyright © 2017 uhcl.edu. All rights reserved.
//

import UIKit

class StatisticsTableViewController: UITableViewController {
    
    var userName: String = ""
    var userDataModel = userDBModel()

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    func findindex() -> Int{
        
        var lastuser = userDataModel.userdetails.count
        
        if lastuser >= 1 {
            for i1 in 0...lastuser-1 {
                
                if userDataModel.userdetails[i1].username == userName {
                    
                    
                    return i1
                }
                
                
            }
            
        }
        return 0
            }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        print("title name")
        if section == 0 {
            return "Recent Speeds"
        }else {
            return "Top Speeds"
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        print("no of rows")
        if section == 0 {
            return 3
        }else {
            return userDataModel.userdetails.count
        }
    }
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    var i = 0
    var speed: Int = 0
    var name: String = ""
    let usercellIdentifier = "userspeed"
    var cell =
        tableView.dequeueReusableCell(withIdentifier:
            usercellIdentifier, for: indexPath)
    i = findindex()
   
    var lastone = userDataModel.userdetails.count
    
    print("cell creation")
    if indexPath.section == 0 {
   
        speed = userDataModel.userdetails[i].userSpeed[indexPath.row]
    }
    else{
    
  name = userDataModel.userdetails[indexPath.row].username
    
    }
    cell.textLabel?.text = "\(speed)"

    if indexPath.section == 1{
    
        cell.detailTextLabel?.text = "\(userDataModel.userdetails[indexPath.row].userSpeed.max())"
    
    }
    return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let tbc1 = tabBarController as! mycustomtabcontrollerViewController
        userName = tbc1.usernme
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    }
