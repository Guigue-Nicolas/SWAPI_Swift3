//
//  CharactersViewController.swift
//  GuigueSwiftEvaluation
//
//  Created by stagiaire on 05/05/2017.
//  Copyright © 2017 stagiaire. All rights reserved.
//

import UIKit
import Alamofire
import Foundation


class CharactersViewController: UIViewController {
    @IBOutlet weak var CharactersUiBar: UITabBarItem!
    @IBOutlet weak var Text: UITextView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var skinLabel: UILabel!
    @IBOutlet weak var eyeLabel: UILabel!
    @IBOutlet weak var hairLabel: UILabel!
    var Caracters:[NSDictionary] = [] // Initialisation de ma liste de Personnages
    var caracterID:Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("https://swapi.co/api/people/").validate().responseJSON { (response:DataResponse<Any>) in
            if response.result.isSuccess {
                if let json = response.result.value as? [String: Any]
                {
                    for oneRow in json["results"] as! NSArray{
                        let oneRow:NSDictionary = oneRow as! NSDictionary
                        let oneCaracter = ["name": oneRow["name"], "gender": oneRow["gender"], "skin": oneRow["skin_color"], "eye": oneRow["eye_color"], "hair": oneRow["hair_color"]] // Création d'un Dictionnaire Contenant les données d'un Personnage.
                        self.Caracters.append(oneCaracter as NSDictionary) // Ajout d'un Personnage à ma liste des Personnages
                    }
                    self.nameLabel.text = "\(self.Caracters[self.caracterID]["name"]!)"
                    self.genderLabel.text = "\(self.Caracters[self.caracterID]["gender"]!)"
                    self.skinLabel.text = "\(self.Caracters[self.caracterID]["skin"]!)"
                    self.eyeLabel.text = "\(self.Caracters[self.caracterID]["eye"]!)"
                    self.hairLabel.text = "\(self.Caracters[self.caracterID]["hair"]!)"
                    //print(self.Caracters)
                }
            }
        }
    }
    
    @IBAction func NextButton(_ sender: UIButton) {
        if self.caracterID == self.Caracters.count - 1 {
            self.caracterID = 0
        }else{
            self.caracterID = self.caracterID+1
        }
        self.nameLabel.text = "\(self.Caracters[self.caracterID]["name"]!)"
        self.genderLabel.text = "\(self.Caracters[self.caracterID]["gender"]!)"
        self.skinLabel.text = "\(self.Caracters[self.caracterID]["skin"]!)"
        self.eyeLabel.text = "\(self.Caracters[self.caracterID]["eye"]!)"
        self.hairLabel.text = "\(self.Caracters[self.caracterID]["hair"]!)"
    }
    
    @IBAction func PrevButton(_ sender: UIButton) {
        if self.caracterID == 0 {
            self.caracterID = self.Caracters.count-1
        }else{
            self.caracterID = self.caracterID-1
        }
        self.nameLabel.text = "\(self.Caracters[self.caracterID]["name"]!)"
        self.genderLabel.text = "\(self.Caracters[self.caracterID]["gender"]!)"
        self.skinLabel.text = "\(self.Caracters[self.caracterID]["skin"]!)"
        self.eyeLabel.text = "\(self.Caracters[self.caracterID]["eye"]!)"
        self.hairLabel.text = "\(self.Caracters[self.caracterID]["hair"]!)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
