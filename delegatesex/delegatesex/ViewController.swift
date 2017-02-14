//
//  ViewController.swift
//  delegatesex
//
//  Created by  on 2/14/17.
//  Copyright © 2017 uhcl. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var college: UIPickerView!
    @IBOutlet weak var message: UILabel!
    var selectedRow: Int = 0
    var values = ["UHCL","UH","UHD","UHV","RICE","TSU","ST.THOMAS", "SAN JACINTO", "HCC", "ALVIN"]
    
    @IBAction func changeMessage(_ sender: UIDatePicker) {
        
        message.text = values[selectedRow] + " " + String(describing: date.date)
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        date.isHidden = true
        self.college.dataSource = self
        self.college.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return values[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        date.isHidden = false
        selectedRow = row
        message.text = values[selectedRow] + " " + String(describing: date.date)

    }

    
}
