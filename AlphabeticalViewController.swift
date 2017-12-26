//
//  AlphabeticalViewController.swift
//  Black History
//
//  Created by Miles Tucker on 12/10/17.
//  Copyright © 2017 Miles Tucker. All rights reserved.
//

import UIKit

class AlphabeticalViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var alphabeticalTable: UITableView!
    var alphabeticalIndex : Int!
    
    var alphabeticalMenu = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
//        print ("yello")
        self.alphabeticalTable.dataSource = self
        self.alphabeticalTable.delegate = self
        
        let nib  = UINib(nibName: "AlphabeticalCell", bundle: nil)
        alphabeticalTable.register(nib, forCellReuseIdentifier: "AlphabeticalCell")
        
        let filePath  = Bundle.main.path(forResource: "NameAlive", ofType: "plist")
        let Items = NSArray(contentsOfFile: filePath!) as! [[String: String]]
        
        let sortedArray = Items.sorted {$0["name"]! < $1["name"]!}
        for item in sortedArray{
           
                alphabeticalMenu.append(item["name"]!)
        }
        // Do any additional setup after loading the view.
    }

    func customInit(alphabeticalIndex:Int, title: String)
    {
        self.alphabeticalIndex = alphabeticalIndex
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
        
        return alphabeticalMenu.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlphabeticalCell", for: indexPath)
        
        // Configure the cell...
        
        cell.textLabel!.text = alphabeticalMenu[indexPath.row]
        // cell.backgroundView = UIImageView(image: UIImage(named: "coolblackbackground1"))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let personVC = storyBoard.instantiateViewController(withIdentifier: "AliveFigureStoryBoard") as! AliveFigureViewController
        personVC.nameText = alphabeticalMenu[indexPath.row]
        self.navigationController?.pushViewController(personVC, animated: true)
        
    }

    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "aliveSegue" {
            if let destinationVC = (segue.destination as? UINavigationController)?.topViewController {
                //                    destinationVC.name = aliveMenu[indexPath.row]
            }
        }
        
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
