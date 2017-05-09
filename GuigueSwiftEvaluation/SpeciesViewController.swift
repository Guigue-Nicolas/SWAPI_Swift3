//
//  SpeciesViewController.swift
//  GuigueSwiftEvaluation
//
//  Created by stagiaire on 05/05/2017.
//  Copyright © 2017 stagiaire. All rights reserved.
//

import UIKit
import Alamofire
import Foundation

class SpeciesViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var lifeLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    var Species:[NSDictionary] = [] // Initialisation de ma liste de Personnages
    var speciesID:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("https://swapi.co/api/species/").validate().responseJSON { (response:DataResponse<Any>) in
            if response.result.isSuccess {
                if let json = response.result.value as? [String: Any]
                {
                    for oneRow in json["results"] as! NSArray{
                        let oneRow:NSDictionary = oneRow as! NSDictionary
                        let oneCaracter = ["name": oneRow["name"], "type": oneRow["classification"], "life": oneRow["average_lifespan"], "language": oneRow["language"], "height": oneRow["average_height"]]
                        self.Species.append(oneCaracter as NSDictionary)
                    }
                    print(self.Species[0])
                    self.nameLabel.text = "\(self.Species[self.speciesID]["name"]!)"
                    self.typeLabel.text = "\(self.Species[self.speciesID]["type"]!)"
                    self.lifeLabel.text = "\(self.Species[self.speciesID]["life"]!)"
                    self.languageLabel.text = "\(self.Species[self.speciesID]["language"]!)"
                    self.heightLabel.text = "\(self.Species[self.speciesID]["height"]!)"
                    //print(self.Caracters)
                }
            }
        }
    }
    
    @IBAction func Exit(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func NextButton(_ sender: UIButton) {
        if self.speciesID == self.Species.count - 1 {
            self.speciesID = 0
        }else{
            self.speciesID = self.speciesID+1
        }
        self.nameLabel.text = "\(self.Species[self.speciesID]["name"]!)"
        self.typeLabel.text = "\(self.Species[self.speciesID]["type"]!)"
        self.lifeLabel.text = "\(self.Species[self.speciesID]["life"]!)"
        self.languageLabel.text = "\(self.Species[self.speciesID]["language"]!)"
        self.heightLabel.text = "\(self.Species[self.speciesID]["height"]!)"
    }
    
    @IBAction func PrevButton(_ sender: UIButton) {
        if self.speciesID == 0 {
            self.speciesID = self.Species.count-1
        }else{
            self.speciesID = self.speciesID-1
        }
        self.nameLabel.text = "\(self.Species[self.speciesID]["name"]!)"
        self.typeLabel.text = "\(self.Species[self.speciesID]["type"]!)"
        self.lifeLabel.text = "\(self.Species[self.speciesID]["life"]!)"
        self.languageLabel.text = "\(self.Species[self.speciesID]["language"]!)"
        self.heightLabel.text = "\(self.Species[self.speciesID]["height"]!)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
