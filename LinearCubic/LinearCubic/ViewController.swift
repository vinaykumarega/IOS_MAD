//
//  ViewController.swift
//  LinearCubic
//
//  Created by  on 2/17/17.
//  Copyright © 2017 uhcl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var label0: UILabel!
    @IBOutlet weak var eqType: UISegmentedControl!
    @IBAction func eqType(_ sender: UISegmentedControl) {
       
        
        
        
        if eqType.selectedSegmentIndex == 0
        {
        label1.isHidden = false
        a_cof.isHidden = false
        b_cof.isHidden = false
        c_cof.isHidden = true
        d_cof.isHidden = true
        a_tf.isHidden = false
        b_tf.isHidden = false
        c_tf.isHidden = true
        d_tf.isHidden = true
        
        }
        
        if eqType.selectedSegmentIndex == 1
        {
            label1.isHidden = false
            a_cof.isHidden = false
            b_cof.isHidden = false
            c_cof.isHidden = false
            d_cof.isHidden = true
            a_tf.isHidden = false
            b_tf.isHidden = false
            c_tf.isHidden = false
            d_tf.isHidden = true
            roots.isHidden = false
            derivative.isHidden = false
            roots_tf.isHidden = false
            derivative_tf.isHidden = false
        
        }
        if eqType.selectedSegmentIndex == 2
        {
        
            label1.isHidden = false
            a_cof.isHidden = false
            b_cof.isHidden = false
            c_cof.isHidden = false
            d_cof.isHidden = false
            a_tf.isHidden = false
            b_tf.isHidden = false
            c_tf.isHidden = false
            d_tf.isHidden = false
            roots.isHidden = false
            derivative.isHidden = false
            roots_tf.isHidden = false
            derivative_tf.isHidden = false

        }
    }
    
    @IBAction func Calculate(_ sender: Any) {
        
        var aval:Double? = 0
        var bval:Double? = 0
        var cval:Double? = 0
       // var dval:Int? = 0
        var root1: Double? = 0
        var root2:Double? = 0
        var x:Double = 0
        var y:Double = 0
        var z:Int = 0
    
        
        if eqType.selectedSegmentIndex == 0
        {
            aval = Double((a_tf.text)!)
            bval = Double((b_tf.text)!)
            root1 = Double(-bval!) / Double(aval!)
            
            roots.isHidden = false
            derivative.isHidden = false
            roots_tf.isHidden = false
            derivative_tf.isHidden = false
            
            roots_tf.text = "\(root1!)"
            derivative_tf.text = "\(aval!)"
            
            
        }
        
        if eqType.selectedSegmentIndex == 1
        {
            aval = Double((a_tf.text)!)
            bval = Double((b_tf.text)!)
            cval = Double((c_tf.text)!)
            x = sqrt(((bval!) * (bval!) - (4 * aval! * cval!)))
            y = (2 * (aval!))
            root1 = (((-bval!) + x) / y )
            root2 = ((Double(-bval!) - x) / (2 * Double(aval!)))
          
            
            roots_tf.text = "Roots are: \(root1!), \(root2!)"
            
            z = Int(2 * aval!)
            derivative_tf.text = "\(z)" + "x" + "\(Int(bval!))"
        }
    }
    @IBOutlet weak var a_cof: UILabel!
    
    @IBOutlet weak var label1: UILabel!
    
    
    @IBOutlet weak var b_cof: UILabel!
    
    @IBOutlet weak var c_cof: UILabel!
    
    
    @IBOutlet weak var d_cof: UILabel!
    
    
    @IBOutlet weak var a_tf: UITextField!
    
    @IBOutlet weak var b_tf: UITextField!
    
    
    @IBOutlet weak var c_tf: UITextField!
    
    
    @IBOutlet weak var d_tf: UITextField!
    
    
    @IBOutlet weak var roots: UILabel!
    
    
    @IBOutlet weak var roots_tf: UITextField!
    
    @IBOutlet weak var derivative: UILabel!
    
    
    @IBOutlet weak var derivative_tf: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }




}
