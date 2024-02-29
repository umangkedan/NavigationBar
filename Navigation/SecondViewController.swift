//
//  SecondViewController.swift
//  Navigation
//
//  Created by Umang Kedan on 23/11/23.
//

import UIKit

class SecondViewController: UIViewController , UINavigationControllerDelegate   {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var name:String?
    var image:UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupData()
    }
    
    func setupData() {
        nameLabel.text = name ?? "No name"
        imageView.image = image
    }
    
    @IBAction func doneAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
 
    @IBAction func nextAction(_ sender: Any) {
        guard let thirdController = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "thirdViewController") as? ThirdViewController else {
            return
        }
        
        self.navigationController?.pushViewController(thirdController, animated: true)
        
    }
    
}
