//
//  HomeViewController.swift
//  Core Data
//
//  Created by Vishal Kamble on 21/12/21.
//

import UIKit

class HomeViewController: UIViewController, UIGestureRecognizerDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var desc: UITextField!
    @IBOutlet weak var titleFld: UITextField!
    @IBOutlet weak var image: UIImageView!
    private let manager: ProductManager = ProductManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageClick))
        gesture.delegate = self
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(gesture)
        // Do any additional setup after loading the view.
    }
    @objc func imageClick() {
        print("Click to image")
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .savedPhotosAlbum
        present(picker, animated: true, completion: nil)
        
    }

   
    @IBAction func addProduct(_ sender: UIButton) {
        let product = ProductModel(title: titleFld.text, desc: desc.text, date: Date(), id: UUID(), image: image.image?.pngData(), isavailable: true)
        manager.createProduct(product: product)
        self.performSegue(withIdentifier: "ProductListViewController", sender: nil)
    }
    
    // MARK: Image picker delegate
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            let img = info[.originalImage] as? UIImage
            self.image.image = img

            dismiss(animated: true, completion: nil)
        }

}
