//
//  ViewController.swift
//  DuckHunter
//
//  Created by Ahmed Abdelkarim on 03/05/2021.
//

import UIKit
import AVFoundation

class ChooseDuckViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var happyDuckButton: UIButton!
    @IBOutlet weak var sadDuckButton: UIButton!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Actions
    @IBAction func happyDuckButtonTapped(_ sender: Any) {
        DuckType.happyDuck.quack()
        
        let chooseGunVC = UIStoryboard(name: "GameStart", bundle: nil).instantiateViewController(withIdentifier: "ChooseGunViewController") as! ChooseGunViewController
        //Property DI
        chooseGunVC.duckType = .happyDuck
        self.navigationController?.pushViewController(chooseGunVC, animated: true)
    }
    
    @IBAction func sadDuckButtonTapped(_ sender: Any) {
        DuckType.sadDuck.quack()
        
        let chooseGunVC = UIStoryboard(name: "GameStart", bundle: nil).instantiateViewController(withIdentifier: "ChooseGunViewController") as! ChooseGunViewController
        //Property DI
        chooseGunVC.duckType = .sadDuck
        self.navigationController?.pushViewController(chooseGunVC, animated: true)
    }
}

