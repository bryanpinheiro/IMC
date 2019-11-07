//
//  ViewController.swift
//  IMC
//
//  Created by Bryan Souza on 06/11/19.
//  Copyright © 2019 Bryan Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let txtHeight = UITextField()
    let txtWeight = UITextField()
    let imgview = UIImageView()
    var images = [#imageLiteral(resourceName: "magreza"),
              #imageLiteral(resourceName: "abaixo"),
              #imageLiteral(resourceName: "ideal"),
              #imageLiteral(resourceName: "sobre"),
              #imageLiteral(resourceName: "obesidade")]
    
    let defaultFont = UIFont(name: "Arial", size: 12)
    
    override func viewWillAppear(_ animated: Bool) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
    }
    
    func setupViews(){
        let screenWidth = UIScreen.main.bounds.width
        //#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        //Label - Calculo do IMC
        let lbCalc =  UILabel()
        lbCalc.text = "Cálculo do IMC"
        lbCalc.font = defaultFont
        lbCalc.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

        //Label - Descubra
        let lbDesc = UILabel()
        lbDesc.text = "Descubra o seu índice de Massa Corporal"
        lbDesc.font = defaultFont
        lbDesc.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        //Label - Peso
        let lbWeight = UILabel()
        lbWeight.text = "Peso (Kg)"
        lbWeight.font = defaultFont
        lbWeight.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        txtWeight.placeholder = "Weight"
        txtWeight.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        txtWeight.font = defaultFont
        txtWeight.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        txtWeight.borderStyle = UITextField.BorderStyle.line
        txtWeight.textAlignment = .center
        txtWeight.delegate = self
        
        //Label - Altura
        let lbHeight =  UILabel()
        lbHeight.text = "Altura (m)"
        lbHeight.font = defaultFont
        lbHeight.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        

        txtHeight.placeholder = "Height"
        txtHeight.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        txtHeight.font = defaultFont
        txtHeight.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        txtHeight.borderStyle = UITextField.BorderStyle.line
        txtHeight.delegate = self
        txtHeight.textAlignment = .center
        
        //Button - Calcular
        let btnCalcular = UIButton()
        btnCalcular.setTitle("Calcular", for: .normal)
        btnCalcular.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        btnCalcular.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        btnCalcular.addTarget(self, action: #selector(calc), for: .touchUpInside)
        
        //StatusView
        let bgView = UIView()
        bgView.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        
        //ImageView
        imgview.backgroundColor = .clear
        imgview.contentMode = .scaleAspectFit
        
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        //VIEW HIERARCHY
        self.view.addSubview(bgView)
        self.view.addSubview(lbCalc)
        self.view.addSubview(lbDesc)
        self.view.addSubview(lbWeight)
        self.view.addSubview(lbHeight)
        self.view.addSubview(txtHeight)
        self.view.addSubview(txtWeight)
        self.view.addSubview(btnCalcular)
        self.view.addSubview(imgview)
        
        //
        //Constraints
        //
        
        lbCalc.translatesAutoresizingMaskIntoConstraints = false
        lbCalc.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 64).isActive = true
        lbCalc.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        lbCalc.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        
        lbDesc.translatesAutoresizingMaskIntoConstraints = false
        lbDesc.topAnchor.constraint(equalTo: lbCalc.bottomAnchor, constant: 12).isActive = true
        lbDesc.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        lbDesc.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        
        lbWeight.translatesAutoresizingMaskIntoConstraints = false
        lbWeight.topAnchor.constraint(equalTo: lbDesc.bottomAnchor, constant: 36).isActive = true
        lbWeight.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        
        lbHeight.translatesAutoresizingMaskIntoConstraints = false
        lbHeight.topAnchor.constraint(equalTo: lbDesc.bottomAnchor, constant: 36).isActive = true
        lbHeight.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        
        txtWeight.translatesAutoresizingMaskIntoConstraints = false
        txtWeight.topAnchor.constraint(equalTo: lbWeight.bottomAnchor, constant: 12).isActive = true
        txtWeight.widthAnchor.constraint(equalToConstant: (screenWidth-48) / 2).isActive = true
        txtWeight.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        txtWeight.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        txtHeight.translatesAutoresizingMaskIntoConstraints = false
        txtHeight.topAnchor.constraint(equalTo: lbHeight.bottomAnchor, constant: 12).isActive = true
        txtHeight.leadingAnchor.constraint(equalTo: txtWeight.trailingAnchor, constant: 8).isActive = true
        txtHeight.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        txtHeight.heightAnchor.constraint(equalToConstant: 36).isActive = true

        btnCalcular.translatesAutoresizingMaskIntoConstraints = false
        btnCalcular.topAnchor.constraint(equalTo: txtWeight.bottomAnchor, constant: 12).isActive = true
        btnCalcular.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        btnCalcular.widthAnchor.constraint(equalToConstant: 128).isActive = true
        btnCalcular.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        bgView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        bgView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        bgView.bottomAnchor.constraint(equalTo: btnCalcular.bottomAnchor, constant: 8).isActive = true
        
        imgview.translatesAutoresizingMaskIntoConstraints = false
        imgview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -48).isActive = true
        imgview.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 48).isActive = true
        imgview.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -48).isActive = true
        imgview.topAnchor.constraint(equalTo: bgView.bottomAnchor, constant: 48).isActive = true
        
        
    }
    
    //MARK: ACTIONS
    
    @objc func calc(_ sender: UIButton){

        if(txtHeight.isNumber() && txtWeight.isNumber()){
            let weight = Double(txtWeight.text!)!
            let height = Double(txtHeight.text!)!
            let r = height * height
            
            let imc = weight / r
            
            let situation: [Double] = [17, 18.49, 24.99, 29.99]
            
            for i in 0..<situation.count {
                if (imc <= situation[i]){
                    imgview.image = images[i]
                    break
                }
                else if (i == 3){
                    imgview.image = images[4]
                }
            }
            
            //360
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
                self.imgview.transform = CGAffineTransform(rotationAngle: .pi)
            }) { (_) in
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                   self.imgview.transform = CGAffineTransform(rotationAngle: 0)
                 })
            }
            
        }
        
    }
    

    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("TextField did begin editing method called")
    }

}

extension UITextField {
    func isNumber() -> Bool{
        
        if !self.text!.isEmpty {
            if let text = self.text{
                let arr = text.split(separator: " ")
                let number: Double? = Double(arr[0])
                
                return number != nil
            }
            else {
                return false
            }
        }
        else {
            return false
        }
        
    }
}
