//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Anil on 8/14/17.
//  Copyright © 2017 Anil. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var switchBtn: UISwitch!
    
    let textFieldKeyConstant = "textFieldKeyName"
    let switchKeyConstant = "switchKeyName"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        if let textFieldValue = defaults.string(forKey: textFieldKeyConstant) {
            textField.text = textFieldValue
        }
        if (defaults.bool(forKey: switchKeyConstant)) {
            switchBtn.isOn = true
        } else {
            switchBtn.isOn = false
        }
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let abcd : ViewController = segue.destination as! ViewController
        
        let billNew = Double(textField.text!) ?? 0
        
         let tipNew = billNew / 100
        
        abcd.tipLabel.text = String(format: "$%.2f", tipNew)
    }
    
    
    @IBAction func saveDefaultValue(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.setValue(textField.text, forKey: textFieldKeyConstant)
        defaults.set(switchBtn.isOn, forKey: switchKeyConstant)
        defaults.synchronize()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
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
