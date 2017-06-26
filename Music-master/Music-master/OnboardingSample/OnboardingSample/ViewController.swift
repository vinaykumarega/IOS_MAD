//
//  ViewController.swift
//  OnboardingSample
//
//  
//

import UIKit
import Material

class ViewController: UIViewController {
    
    let pageView1 = OnboardingView(frame: UIScreen.main.bounds)
    let pageView2 = OnboardingView(frame: UIScreen.main.bounds)
    let pageView3 = OnboardingView(frame: UIScreen.main.bounds)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController {
    fileprivate func preparePages() {
    }
}

