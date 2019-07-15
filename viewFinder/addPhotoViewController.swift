//
//  addPhotoViewController.swift
//  viewFinder
//
//  Created by Apple on 7/15/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class addPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
          //this tells our object that any info (aka photos) is going back to this class (self)
    }
    
    var imagePicker = UIImagePickerController()

    @IBOutlet weak var newImage: UIImageView!
    @IBAction func camera(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func photoLibrary(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
        imagePicker.sourceType = .camera
        //this allows us to open our camera
        
        present(imagePicker, animated: true, completion: nil)
        //present is a built in func in apple that allows us to access our camera info and the animated allows for a smooth transition if we set it to true and cmpletion means that we exit out after we choose nil
        
    }
    
    
    
    @IBAction func albumsTapped(_ sender: Any) {
        imagePicker.sourceType = .savedPhotosAlbum
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        //the selected Image will replace the stock photo in our Image View with the following code:
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage { newImage.image =  selectedImage}
        imagePicker.dismiss(animated: true, completion: nil) }

    @IBAction func savePhotoTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)? .persistentContainer.viewContext {
            
            
            let photoToSave = Photos(entity: Photos.entity(), insertInto: context)
        }
    }
    
}




