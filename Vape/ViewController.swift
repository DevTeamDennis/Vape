//
//  ViewController.swift
//  Vape
//
//  Created by Dennis Feldbusch on 16.03.18.
//  Copyright © 2018 Dennis Feldbusch. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var menge: UITextField!
    @IBOutlet weak var nikotin: UITextField!
    @IBOutlet weak var nikShot: UITextField!
    @IBOutlet weak var aroma: UITextField!			
    @IBOutlet weak var base: UILabel!
    @IBOutlet weak var nikotinErg: UILabel!
    @IBOutlet weak var aromaErg: UILabel!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var mybutton: UIButton!
    @IBOutlet weak var test1Field: UITextField!
    @IBOutlet weak var test2Field: UITextField!
    @IBOutlet weak var test3Field: UITextField!
    
    var geschmackA = UserDefaults.standard
    var staerkeA = UserDefaults.standard
    var number = UserDefaults.standard
    
    //var test2 = ["Creamy Fruits","Orange Kiss","Kirsch Banane","Waldmeister","SM Twister"] as [String]
    //var test3 = ["0.5 mg","0.5 mg","1.2 mg","0.5 mg","0.5 mg"]                              as [String]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        number.array(forKey: "number")
        geschmackA.array(forKey: "geschmackA")
        staerkeA.array(forKey: "staerkeA")
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        if showNumber != nil {
//            print("notnil")
//            showNumber.text = number.array(forKey: "number")
//        }
        super.viewDidAppear(animated)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculate(_ sender: Any) {
        
        //Berechnungen
        
        var menge1 :Double? = nil
        if self.menge.text?.contains(",") == true{
            menge1 = Double(self.menge.text!.replacingOccurrences(of: ",", with: "."))
        }else{
            menge1 = Double(self.menge.text!)
        }
        
        var nikotin1 :Double? = nil
        if self.nikotin.text?.contains(",") == true{
            nikotin1 = Double(self.nikotin.text!.replacingOccurrences(of: ",", with: "."))
        }else{
            nikotin1 = Double(self.nikotin.text!)
        }
        
        var nikShot1 :Double? = nil
        if self.nikShot.text?.contains(",") == true{
            nikShot1 = Double(self.nikShot.text!.replacingOccurrences(of: ",", with: "."))
        }else{
            nikShot1 = Double(self.nikShot.text!)
        }
        
        var aroma1  :Double? = nil
        if self.aroma.text?.contains(",") == true{
            aroma1 = Double(self.aroma.text!.replacingOccurrences(of: ",", with: "."))
        }else{
            aroma1 = Double(self.aroma.text!)
        }
        
        if nikShot1 == nikotin1{
            
        }else{if (menge1 == nil || nikotin1 == nil || nikShot1 == nil || aroma1 == nil) {
        }else{
            self.aromaErg.text = "\(menge1! * aroma1! * 0.01)"
            
            self.nikotinErg.text = "\(menge1! / nikShot1! * nikotin1!)"
            
            self.base.text = "\(menge1!-menge1! * aroma1! * 0.01-menge1! / nikShot1! * nikotin1!)"
            
            }}
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if geschmackA.array(forKey: "geschmackA") == nil{
            return 0
        }else{
            return geschmackA.array(forKey: "geschmackA")!.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "customCell" ) as! CustomTableViewCell
        cell.lbl1.text = number.array(forKey: "number")?[indexPath.row] as? String
        cell.lbl2.text = geschmackA.array(forKey: "geschmackA")?[indexPath.row] as? String
        cell.lbl3.text = staerkeA.array(forKey: "staerkeA")?[indexPath.row] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            number.mutableArrayValue(forKey: "number").removeObject(at: indexPath.item)
            geschmackA.mutableArrayValue(forKey: "geschmackA").removeObject(at: indexPath.item)
            staerkeA.mutableArrayValue(forKey: "staerkeA").removeObject(at: indexPath.item)
            table.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    @IBAction func save(_ sender: Any) {
        test1Field.placeholder = "Type your Number"
        number.mutableArrayValue(forKey: "number").add(test1Field.text!)
        geschmackA.mutableArrayValue(forKey: "geschmackA").add(test2Field.text!)
        staerkeA.mutableArrayValue(forKey: "staerkeA").add(test3Field.text! + " mg")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        print(number.mutableArrayValue(forKey: "number").object(at: indexPath.item))
        table.deselectRow(at: indexPath, animated: true)
        //        performSegue(withIdentifier: "show", sender: self)
        //POP UP!!!!
        let alert = UIAlertController(title: number.mutableArrayValue(forKey: "number").object(at: indexPath.item) as? String, message: "Test Msg", preferredStyle: .alert)
        alert.message = "\n"+"Geschmack = "+(geschmackA.mutableArrayValue(forKey: "geschmackA").object(at: indexPath.item) as! String)+"\n"+"\n"+"Nikotinstärke = "+(staerkeA.mutableArrayValue(forKey: "staerkeA").object(at: indexPath.item) as! String)
        
        alert.addAction(UIAlertAction(title: "Back", style: .default, handler: nil))
        
        self.present(alert, animated: true)
        
    }
    
    
    
}
