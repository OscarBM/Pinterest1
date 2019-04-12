//
//  pinCell.swift
//  pinterest
//
//  Created by Alumno IDS on 4/4/19.
//  Copyright © 2019 Alumno IDS. All rights reserved.
//

import UIKit


class pinCell : UICollectionViewCell {
    override init (frame: CGRect){
        super.init(frame: frame)
        setup()
    }
    
    func setup(){
        
        
        
        //Set image
        self.addSubview(imageView1)
        imageView1.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height * 0.02).isActive = true
        imageView1.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView1.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 8/10).isActive = true
        imageView1.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 8/10).isActive = true
        imageView1.heightAnchor.constraint(equalToConstant: (self.frame.height * 0.8)).isActive = true
        
        //Set label
        self.addSubview(label1)
        label1.topAnchor.constraint(equalTo: imageView1.bottomAnchor, constant: (self.bounds.height * 0.02)).isActive = true
        label1.leftAnchor.constraint(equalTo: imageView1.leftAnchor).isActive = true
        label1.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 80/100).isActive = true
        label1.heightAnchor.constraint(equalToConstant: 17).isActive = true
        label1.backgroundColor = .red //Coloracion de prueba
        
        //Label de prueba
        self.addSubview(label3)
        label3.topAnchor.constraint(equalTo: imageView1.topAnchor, constant: (self.bounds.height * 0.02)).isActive = true
        label3.leftAnchor.constraint(equalTo: imageView1.leftAnchor).isActive = true
        label3.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 80/100).isActive = true
        label3.heightAnchor.constraint(equalToConstant: 17).isActive = true
        label3.backgroundColor = .green
        
        //Set image de puntitos
        self.addSubview(imageViewOptions)
        imageViewOptions.centerYAnchor.constraint(equalTo: label1.centerYAnchor).isActive = true
        imageViewOptions.rightAnchor.constraint(equalTo: imageView1.rightAnchor).isActive = true
        imageViewOptions.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 7/100).isActive = true
        imageViewOptions.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 7/100).isActive = true
        
        //Propieades de celda en general
        self.backgroundColor = .white
        
    }
    
    //Label de prueba
    let label3 : UILabel = {
        let label2 = UILabel()
        label2.textColor = .black
        label2.text = "123"
        label2.translatesAutoresizingMaskIntoConstraints = false
        return label2
    }()
    
    //Imagen
    let imageView1 : UIImageView = {
        let imageView2 = UIImageView()
        imageView2.image = #imageLiteral(resourceName: "pinterestPin")
        imageView2.translatesAutoresizingMaskIntoConstraints = false
        return imageView2
    }()
    
    //Label
    let label1 : UILabel = {
        let label2 = UILabel()
        label2.textColor = .black
        label2.translatesAutoresizingMaskIntoConstraints = false
        return label2
    }()
    
    //Imagen de puntitos
    let imageViewOptions : UIImageView = {
        let imageView3 = UIImageView()
        imageView3.image = #imageLiteral(resourceName: "3Puntos")
        imageView3.translatesAutoresizingMaskIntoConstraints = false
        return imageView3
    }()
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}
