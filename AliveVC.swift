//
//  AliveVC.swift
//  Black History
//
//  Created by Miles Tucker on 11/13/17.
//  Copyright © 2017 Miles Tucker. All rights reserved.
//

import UIKit

class AliveVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var AliveTable: UITableView!
    
    
    
    var aliveIndex : Int!

    var aliveMenu = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("yello")
        self.AliveTable.dataSource = self
        self.AliveTable.delegate = self
        
        let nib  = UINib(nibName: "AliveCell", bundle: nil)
        AliveTable.register(nib, forCellReuseIdentifier: "AliveCell")
       
        let filePath  = Bundle.main.path(forResource: "NameAlive", ofType: "plist")
        let Items = NSArray(contentsOfFile: filePath!) as! [[String: AnyObject]]
        
        for item in Items{
            if(item["alive"]?.isEqual("T"))!
            {
                aliveMenu.append(item["name"] as! String)
            }
        }
        // Do any additional setup after loading the view.
    }
   // var aliveMenu [String] = getDataForAlive(alive:false)
//    var aliveMenu: [String] = []
//        aliveMenu = getDataForAlive(alive: "F")

    
    func customInit(aliveIndex:Int, title: String)
    {
        self.aliveIndex = aliveIndex
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
        
        return aliveMenu.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AliveCell", for: indexPath)
        
        // Configure the cell...
        
        cell.textLabel!.text = aliveMenu[indexPath.row]
        // cell.backgroundView = UIImageView(image: UIImage(named: "coolblackbackground1"))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
   
//            [self .performSegue(withIdentifier:"aliveSegue", sender: self)]
//            self.performSegue(withIdentifier: "aliveSegue", sender: indexPath)
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//            let personVC = AliveFigureViewController()
            let personVC = storyBoard.instantiateViewController(withIdentifier: "AliveFigureStoryBoard") as! AliveFigureViewController
            personVC.nameText = aliveMenu[indexPath.row]
            self.navigationController?.pushViewController(personVC, animated: true)
//            mainMenu.deselectRow(at: indexPath, animated: true)

    }

//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
////        let aliveFigVC = AliveFigureViewController()
//        let aliveFigVC = storyBoard.instantiateViewController(withIdentifier: "AliveFigureViewController") as! AliveFigureViewController
//        aliveFigVC.name.text = aliveMenu[indexPath.row]
//        if indexPath.row == 0
//        {
////            let AliveFigVC = AliveFigureViewController()
//////            AliveFigVC.customInit(menuIndex: indexPath.row, title: menu[indexPath.row])
//////            self.navigationController?.pushViewController(HistoricalFigsVC, animated: true)
////            AliveFigVC.name.text = aliveMenu[indexPath.row]
//////            AliveFigVC.description. = Items[aliveMenu[indexPath.row]]
//////            mainMenu.deselectRow(at: indexPath, animated: true)
//        }
//            
//        else if indexPath.row == 1
//        {
//            
//        }
//            
//        else if indexPath.row == 2
//        {
////            [self .performSegue(withIdentifier:"musicSegue", sender: self)]
//            
//        }
    

    
//    func getSwiftArrayFromPlist(name: String)->(Array<Dictionary<String,String>>)
//    {
//        let path = Bundle.main.path(forResource: name, ofType: "plist")
//        
//        var arr : NSArray?
//        arr = NSArray(contentsOfFile: path!)
//        
//        return (arr as? Array<Dictionary<String,String>>)!
//    }
//    
//    func getDataForAlive(alive: String)->(Array<[String:String]>)
//    {
//        let array = getSwiftArrayFromPlist(name: "AliveFigs")
//        let namePredicate = NSPredicate(format: "Alive = %@",alive)
//        let aliveVals = ["T", "F"]
//        return (aliveVals as NSArray).filtered(using: namePredicate) as! (Array<[String : String]>)
//
//    }
//        return array as! (Array<[String : String]>)

//
//        var data = [String]()
//        if let path = Bundle.main.path(forResource: "HistoryFigsArray", ofType: "plist"){
//            if let arrayOfDictionaries = NSArray(contentsOfFile: path){
//                for dict in arrayOfDictionaries {
//                    data.append(dict.objectForKey("name") as! String)
//                }
//            }
//        }
        
//    var myFigsArray: [String] = []
//    if let URL = Bundle.main.url(forResource: "AA", withExtension: "plist") {
//        if let figsFromPlist = NSArray(contentsOf: URL) as? [String] {
//            for myFigs in figsFromPlist {
//                myFigsArray.append(myFigs)
//            }
//        }
//    }
//        
//        return myFigsArray
//    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "aliveSegue" {
                if let destinationVC = (segue.destination as? UINavigationController)?.topViewController {
//                    destinationVC.name = aliveMenu[indexPath.row]
                }
            }
            
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
 

}
