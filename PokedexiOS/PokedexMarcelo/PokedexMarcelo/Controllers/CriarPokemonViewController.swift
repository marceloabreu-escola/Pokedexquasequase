//
//  CriarPokemonViewControllwe.swift
//  PokedexMarcelo
//
//  Created by Marcelo Abreu on 27/06/2019.
//  Copyright © 2019 Marcelo Abreu. All rights reserved.
//

import UIKit

class CriarPokemonViewController: UIViewController , UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    //Class Reference
    var addPokemon:Pokemon?
    
    //TextFields
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descricaoField: UITextField!
    
    @IBOutlet weak var typeField: UITextField!
    @IBOutlet weak var subTypeField: UITextField!
    
    @IBOutlet weak var XPField: UITextField!
    @IBOutlet weak var HPField: UITextField!
    @IBOutlet weak var powerField: UITextField!
    
    @IBOutlet weak var evolutionField: UITextField!

    //ImageView to upload Image
    @IBOutlet weak var pokeImageField: UIImageView!
    
    var imagePicker = UIImagePickerController()
    var getImage:UIImage?
    
    //validation label
    @IBOutlet weak var validationLabel: UILabel!
    public var isValidated: Bool!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.delegate = self
        descricaoField.delegate = self
        
        imagePicker.delegate = self
        
        XPField.delegate = self
        HPField.delegate = self
        powerField.delegate = self
        evolutionField.delegate = self
        
        validationLabel.isHidden = true
        isValidated = false
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    // upload image button clicked
    @IBAction func uploadTapped(_ sender: Any){
        
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    // Get image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let novaImagem = info[.originalImage] as? UIImage else{return}
        
        pokeImageField.image = novaImagem
        
        dismiss(animated: true, completion: nil)
        
        getImage = novaImagem
        
    }
    
    func validateValues(){
        
        guard let _ = nameField.text, nameField.text?.count != 0 else{
            
            validationLabel.isHidden = false
            validationLabel.text = "Enter the Pokemon's name."
            return
            
        }
        
        guard let _ = descricaoField.text, descricaoField.text?.count != 0 else{
            
            validationLabel.isHidden = false
            validationLabel.text = "Say something nice!"
            return
            
        }
        
        guard let _ = typeField.text, descricaoField.text?.count != 0 else{
            
            validationLabel.isHidden = false
            validationLabel.text = "isn't it Grass?"
            return
            
        }
        
        guard let _ = subTypeField.text, descricaoField.text?.count != 0 else{
            
            validationLabel.isHidden = false
            validationLabel.text = "No sub-type? None is the answer"
            return
            
        }
        
        guard let _ = XPField.text, XPField.text?.count != 0 else{
            
            validationLabel.isHidden = false
            validationLabel.text = "He must have some XP!"
            return
            
        }
        
        guard let _ = HPField.text, HPField.text?.count != 0 else{
            
            validationLabel.isHidden = false
            validationLabel.text = "Come on... s/he is not a Walker!"
            return
            
        }
        
        guard let _ = powerField.text, powerField.text?.count != 0 else{
            
            validationLabel.isHidden = false
            validationLabel.text = "S/He's stronger than you give him/her power"
            return
            
        }
        
        
        
        validationLabel.isHidden = true
        isValidated = true
        print("All camps validated")
        
        
    }
    
    //add Pokemon Button Clicked
    @IBAction func addTapped(_ sender: Any) {
        
        validateValues()
        
        let XPvalue:Int? = Int(XPField.text!)
        let HPvalue:Int? = Int(HPField.text!)
        let powerValue:Int? = Int(powerField.text!)
        
        
        //done
        if(isValidated){
            
            
            //Criar um pokemon
            ListarPokemonViewController.GuardarPokemon.append(Pokemon(imagem: getImage!, name: nameField.text!, type: typeField.text!, subType: subTypeField.text!, description: descricaoField.text!, xp: XPvalue!, hp: HPvalue!, power: powerValue!, evolution: evolutionField.text!))
            
        } else {
            
            validationLabel.text = "Please complete all camps!"
            
        }

    }
    ///Return number pad keyboard when touch anywhere
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        XPField.resignFirstResponder()
        HPField.resignFirstResponder()
        powerField.resignFirstResponder()
        
    }
    
}

//Delegate for textfields
extension CriarPokemonViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn (_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
}


    

