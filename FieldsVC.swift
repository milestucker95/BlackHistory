//
//  FieldsVC.swift
//  Black History
//
//  Created by Miles Tucker on 11/12/17.
//  Copyright © 2017 Miles Tucker. All rights reserved.
//

import UIKit

class FieldsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var fieldsMenu = [String]()
    
    
    @IBOutlet weak var fieldsTable: UITableView!
    
    var figsMenuIndex : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fieldsTable.dataSource = self
        self.fieldsTable.delegate = self
        
        let nib  = UINib(nibName: "fieldsCell", bundle: nil)
        fieldsTable.register(nib, forCellReuseIdentifier: "fieldsCell")
        
        let filePath  = Bundle.main.path(forResource: "NameField", ofType: "plist")
        let Items = NSArray(contentsOfFile: filePath!) as! [[String: AnyObject]]
        var fields = Set<String>()
        for item in Items{
            if (!fields.contains(item["field"] as! String)){
                fields.insert((item["field"] as! String))
                fieldsMenu.append(item["field"] as! String)
//                print(item["description"])
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    func customInit(figsMenuIndex:Int, title: String)
    {
        self.figsMenuIndex = figsMenuIndex
        self.title = title
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return fieldsMenu.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fieldsCell", for: indexPath)
        
        // Configure the cell...
        
        cell.textLabel!.text = fieldsMenu[indexPath.row]
        // cell.backgroundView = UIImageView(image: UIImage(named: "coolblackbackground1"))
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0
        {
            let entertainerVC = EntertainmentViewController()
            entertainerVC.customInit(entertainerIndex: indexPath.row, title: fieldsMenu[indexPath.row])
            self.navigationController?.pushViewController(entertainerVC, animated: true)
            
            fieldsTable.deselectRow(at: indexPath, animated: true)
        }
        
        else if indexPath.row == 1
        {
            let civilRightsVC = CivilRightsViewController()
            civilRightsVC.customInit(civilRightsIndex: indexPath.row, title: fieldsMenu[indexPath.row])
            self.navigationController?.pushViewController(civilRightsVC, animated: true)
            
            fieldsTable.deselectRow(at: indexPath, animated: true)
        }
        
    }
}
