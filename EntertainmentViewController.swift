//
//  EntertainmentViewController.swift
//  Black History
//
//  Created by Miles Tucker on 12/2/17.
//  Copyright © 2017 Miles Tucker. All rights reserved.
//

import UIKit

class EntertainmentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var entertainmentTable: UITableView!
    
    var entertainerIndex : Int!
    
    var entertainerMenu = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.entertainmentTable.dataSource = self
        self.entertainmentTable.delegate = self
        
        let nib  = UINib(nibName: "entertainmentCell", bundle: nil)
        entertainmentTable.register(nib, forCellReuseIdentifier: "entertainmentCell")
        
        let filePath  = Bundle.main.path(forResource: "NameField", ofType: "plist")
        let Items = NSArray(contentsOfFile: filePath!) as! [[String: AnyObject]]
        
        for item in Items{
            if (item["field"]?.isEqual("Entertainment"))!{
                entertainerMenu.append(item["name"] as! String)
            print(item["description"])
        }
    }
    }
    
        // Do any additional setup after loading the view.
    
    
    
    func customInit(entertainerIndex:Int, title: String)
    {
        self.entertainerIndex = entertainerIndex
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
        
        return entertainerMenu.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entertainmentCell", for: indexPath)
        
        // Configure the cell...
        
        cell.textLabel!.text = entertainerMenu[indexPath.row]
        // cell.backgroundView = UIImageView(image: UIImage(named: "coolblackbackground1"))
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        //            let personVC = AliveFigureViewController()
        let personVC = storyBoard.instantiateViewController(withIdentifier: "AliveFigureStoryBoard") as! AliveFigureViewController
        personVC.nameText = entertainerMenu[indexPath.row]
        self.navigationController?.pushViewController(personVC, animated: true)
    
    
//        if indexPath.row == 0
//        {
//            let decadeVC = DecadeViewController()
//            decadeVC.customInit(decadeIndex: indexPath.row, title: entertainerMenu[indexPath.row])
//            self.navigationController?.pushViewController(decadeVC, animated: true)
//            
//            entertainmentTable.deselectRow(at: indexPath, animated: true)
//        }
//            
//        else if indexPath.row == 1
//        {
//            let nothing = "nothing"
//        }
//        else if indexPath.row == 2
//        {
//            let fieldsVC = FieldsVC()
//            fieldsVC.customInit(figsMenuIndex: indexPath.row, title: entertainerMenu[indexPath.row])
//            self.navigationController?.pushViewController(fieldsVC, animated: true)
//            
//            entertainmentTable.deselectRow(at: indexPath, animated: true)
//        }
//            
//        else if indexPath.row == 3
//        {
//            let aliveVC = AliveVC()
//            aliveVC.customInit(aliveIndex: indexPath.row, title: entertainerMenu[indexPath.row])
//            self.navigationController?.pushViewController(aliveVC, animated: true)
//            
//            entertainmentTable.deselectRow(at: indexPath, animated: true)
//        }
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

