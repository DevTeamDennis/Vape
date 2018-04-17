//
//  ShowViewController.swift
//  Vape
//
//  Created by Dennis Feldbusch on 17.04.18.
//  Copyright © 2018 Dennis Feldbusch. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {
    
    var showGeschmack: String!
    var showNumber: String!
    var showStaerke: String!
    
    
    @IBOutlet weak var showLabel: UILabel!
    @IBOutlet weak var showGeschmackLabel: UILabel!
    @IBOutlet weak var showStaerkeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (showNumber == nil || showGeschmack == nil || showStaerke == nil ){return}
        // Do any additional setup after loading the view.
        
        showLabel.text = showNumber
       showGeschmackLabel.text = showGeschmack
        showStaerkeLabel.text = showStaerke
        
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
