//
//  FirstViewController.swift
//  Navigation
//
//  Created by Umang Kedan on 23/11/23.
//

import UIKit

class FirstViewController: UIViewController, UINavigationControllerDelegate {
    
    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var choosePictureButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "First"
        setUpImagePicker()
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let secondController = segue.destination as? SecondViewController else {
            return
        }
        secondController.name = nameLabel.text
        secondController.image = imageView1.image
    }

    func pushToSecondController(){
        guard let secondController = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "secondViewController") as? SecondViewController else {
            return
        }
        
        secondController.name = nameLabel.text
        secondController.image = imageView1.image
        
        self.navigationController?.pushViewController(secondController, animated: true)
    }
    
    func setAlertWithField(){
        let alert = UIAlertController(title: "Enter Image Title", message: "Please Enter Your Image Title ", preferredStyle: .alert)
        let okayButton = UIAlertAction(title: "Submit", style: .default, handler: {_ in
            print("submitted")
            self.pushToSecondController()
        })

        alert.addTextField(configurationHandler: { textField in
            print(textField.text ?? textField)
            textField.delegate = self
        })
        
        alert.addAction(okayButton)
        self.present(alert, animated: true)
    }
    

    func setUpImagePicker(){
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        
    }
    
    @IBAction func chooseButtonAction(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker,animated: true)
        
    }
}
extension FirstViewController : UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("Should Begin Editing ")
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Begin editing ")
        
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("End Editing")
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Ended")
        print(textField.text ?? "")
        nameLabel.text = textField.text ?? ""
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("clear")
        return true
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("return")
        return true
    }
}

extension FirstViewController : UIImagePickerControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("hello")
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage]as? UIImage{
            imageView1.image = image
            
            self.imagePicker.dismiss(animated: true)
            setAlertWithField()
        }
    
    }
}
