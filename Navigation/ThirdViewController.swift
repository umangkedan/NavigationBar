//
//  ThirdViewController.swift
//  Navigation
//
//  Created by Umang Kedan on 23/11/23.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Third"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func backToRootAction(_ sender: Any) {
       // self.navigationController?.popToRootViewController(animated: true)
        
//        guard let firstController = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "firstViewController") as? FirstViewController else {
//            return
//        }
        
        
        guard let firstController = navigationController?.viewControllers[0] as? FirstViewController else {
            return
        }
        
        self.navigationController?.popToViewController(firstController, animated: true)
        
        
        //self.navigationController?.pushViewController(firstController, animated: true)
        
    }

}
