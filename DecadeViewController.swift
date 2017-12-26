//
//  DecadeViewController.swift
//  Black History
//
//  Created by Miles Tucker on 11/13/17.
//  Copyright © 2017 Miles Tucker. All rights reserved.
//

import UIKit

class DecadeViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    
    @IBOutlet weak var decadeTable: UITableView!
    
    var decadeMenu = ["1900s","1910s", "1920s", "1930s","1940s","1950s","1960s","1970s","1980s","1990s","2000s","2010s"]
    
    var decadeIndex : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.decadeTable.dataSource = self
        self.decadeTable.delegate = self
        
        let nib  = UINib(nibName: "DecadeCell", bundle: nil)
        decadeTable.register(nib, forCellReuseIdentifier: "DecadeCell")
        
        // Do any additional setup after loading the view.
    }
    
    
    func customInit(decadeIndex:Int, title: String)
    {
        self.decadeIndex = decadeIndex
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
        
        return decadeMenu.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DecadeCell", for: indexPath)
        
        // Configure the cell...
        
        cell.textLabel!.text = decadeMenu[indexPath.row]
        // cell.backgroundView = UIImageView(image: UIImage(named: "coolblackbackground1"))
        
        return cell
    }

}
