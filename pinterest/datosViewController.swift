//
//  datosViewController.swift
//  pinterest
//
//  Created by Oscar on 3/7/19.
//  Copyright © 2019 Alumno IDS. All rights reserved.
//

import UIKit
import Firebase
class datosViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Registrate"
        view.backgroundColor = UIColor(r: 255, g: 255, b: 255)
        //let padding1:CGFloat = 10
        
        
        //label1.center = CGPoint(x: 50, y: 50)
        //label1.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        //label1.textAlignment = .center
        label1.text = "Favor de poner su correo electronico"
        self.view.addSubview(label1)
        
        //add subview
        view.addSubview(emailTextField)
        view.addSubview(firstButton)
        
        
        
        //constraints
        // constraints for input
        emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -220).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        
        
        
        firstButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 210).isActive = true
        firstButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        firstButton.leftAnchor.constraint(equalTo: emailTextField.leftAnchor).isActive = true
        firstButton.rightAnchor.constraint(equalTo: emailTextField.rightAnchor).isActive = true
        
        
        
    }
    
    
    let emailTextField : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Correo"
        tf.backgroundColor = .white
        return tf
    }()
    
    lazy var firstButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor(red: 219/255, green: 50/255, blue: 54/255, alpha: 1)
        ub.setTitleColor(.white, for: .normal)
        ub.setTitle("Siguiente", for: .normal)
        ub.translatesAutoresizingMaskIntoConstraints = false
        //ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)//Esta linea la metiste TU
        return ub
    }()
    
    let label1 = UILabel(frame: CGRect(x: 10, y: 70, width: 300, height: 21))
    
    
    //Esta funcion la metiste TU
    @objc func handleButton(){
        userL?.mail = emailTextField.text
        
    }
    
    /*
     @objc func handleButton(){
     guard let email = emailTextField.text, let password = passwordTextField.text, let name = nameTextField.text else {
     print("Not valid")
     return
     }
     
     var data:AuthDataResultCallback
     Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
     
     var user2 = user?.user
     if error != nil {
     print("ira esto")
     print(error)
     return
     }
     
     guard let uid = user2?.uid else {
     print("algo salio mal")
     return
     }
     //sucessfully
     var ref = Database.database().reference(fromURL: "https://pinterest3-7db31.firebaseio.com/")
     let values = ["name" :name, "email": email]
     let usersRef = ref.child("users").child(uid)
     
     usersRef.updateChildValues(values, withCompletionBlock: { (error, databaseRef:DatabaseReference?) in
     if  error != nil {
     print("esto salio muy mal")
     print(error)
     }
     })
     
     
     //Incluir mensaje dummy
     let mensaje = ["mensaje" : "soy un mensaje dummy", "uid" : uid]
     let mensajeRef = ref.child("messages").child(uid)
     mensajeRef.updateChildValues(mensaje)
     
     
     // successfully included
     print("Saved user successfully into our database")
     print("El nombre es: \(self.nameTextField.text)")
     print("El correo es: \(self.emailTextField.text)")
     print("El contrasena es: \(self.passwordTextField.text)")
     
     }
     }*/
    
}

/*
extension UIColor {
    
    convenience init(r:CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

*/
