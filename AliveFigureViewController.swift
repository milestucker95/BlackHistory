//
//  AliveFigureViewController.swift
//  Black History
//
//  Created by Miles Tucker on 12/2/17.
//  Copyright © 2017 Miles Tucker. All rights reserved.
//

import UIKit

class AliveFigureViewController: UIViewController,UITextFieldDelegate {
    
 
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var textBox: UITextField!
//    @IBOutlet weak var figureDescription: UILabel!

    @IBOutlet weak var figureDescription: UITextView!
  
    @IBOutlet weak var FigurePortrait: UIImageView!
    var nameText = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        name.text = nameText
        let filePath  = Bundle.main.path(forResource: "NameDesc", ofType: "plist")
        let Items = NSArray(contentsOfFile: filePath!) as! [[String: AnyObject]]
        
        for item in Items{
            if (item["name"]?.isEqual(name.text))!{
                figureDescription.text = item["description"] as! String?
                
//            
////                figureDescription.sizeToFit()
//                figureDescription.lineBreakMode = NSLineBreakMode.byWordWrapping
//                figureDescription.adjustsFontSizeToFitWidth = true
//                figureDescription.textAlignment = .center
                figureDescription.text = item["description"] as! String!

                FigurePortrait.image = UIImage(named: name.text!);
            }
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
