//
//  CameraViewController.swift
//  parstagram
//
//  Created by Jonah Tjandra on 3/25/22.
//

import UIKit
import AlamofireImage
import Parse

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var comment: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let imageData = info[.editedImage] as! UIImage
        let size = CGSize(width: 300, height: 300)
        let scaledImage = imageData.af.imageScaled(to: size)
        image.image = scaledImage
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func submit(_ sender: Any) {
        let post = PFObject(className: "Posts")
        let imageData = image.image!.pngData()
        let image_file = PFFileObject(data: imageData!)
        post["caption"] = comment.text!
        post["author"] = PFUser.current()!
        post["post"] = image_file
        
        post.saveInBackground { success, error in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("saved!")
            } else {
                print("Error: \(error)")
            }
            
        }
    }
}
