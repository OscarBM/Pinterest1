//
//  UploadImageVC.swift
//  pinterest
//
//  Created by Oscar on 4/25/19.
//  Copyright © 2019 Alumno IDS. All rights reserved.
//

import UIKit
import Firebase

class UploadImageVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(chooseButton)
        view.addSubview(uploadButton)
        view.addSubview(imageToUpload)
        
        chooseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        chooseButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 250).isActive = true
        chooseButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        chooseButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        uploadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        uploadButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200).isActive = true
        uploadButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        uploadButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        imageToUpload.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20).isActive = true
        imageToUpload.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageToUpload.widthAnchor.constraint(equalToConstant: 300).isActive = true
        imageToUpload.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        
        
    }
    
    let imageToUpload : UIImageView = {
        let imageV = UIImageView()
        imageV.image = #imageLiteral(resourceName: "pinterestLogo")
        imageV.translatesAutoresizingMaskIntoConstraints = false
        return imageV
    }()
    
    
    lazy var chooseButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor(red: 80/255, green: 101/255, blue: 161/255, alpha: 1)
        ub.setTitle("Elegir imagen", for: .normal)
        ub.translatesAutoresizingMaskIntoConstraints = false
        ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        return ub
    }()
    
    lazy var uploadButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
        ub.setTitle("Subir imagen", for: .normal)
        ub.translatesAutoresizingMaskIntoConstraints = false
        ub.addTarget(self, action: #selector(uploadImage), for: .touchUpInside)
        return ub
    }()
    
    // -------------- Al presionar el boton --------------------
    @objc func handleButton(_ sender:UIButton){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
        /*let datosViewC = datosViewController()
        self.navigationController?.pushViewController(datosViewC, animated: true)*/
    }
    
    
    @objc func uploadImage(){
        let storageRef = Storage.storage().reference().child("MEMES").child("miimagen.jpg")
        
        if let uploadData = UIImageJPEGRepresentation(imageToUpload.image!, 300){
            storageRef.putData(uploadData, metadata: nil, completion: { (metadata, error) in
                if error != nil {
                    print(error)
                    return
                }
                print(metadata)
            })
        }
        
        
        
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage{
            print(editedImage.size)
            selectedImageFromPicker = editedImage
            print(selectedImageFromPicker?.size)
        }
           /*
        else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage{
            print(originalImage.size)
        }*/
        if let selectedImage = selectedImageFromPicker {
            imageToUpload.image = selectedImage
        }
        
        print("imagen seleccionada")
        //print(info)
        
        dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("cancelled")
    }
    
    
}
