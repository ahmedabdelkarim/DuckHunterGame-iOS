//
//  ChooseGunViewController.swift
//  DuckHunter
//
//  Created by Ahmed Abdelkarim on 03/05/2021.
//

import UIKit

class ChooseGunViewController: UIViewController {
    //MARK: - Properties
    var duckType: DuckType!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Actions
    @IBAction func rightGunButtonTapped(_ sender: Any) {
        GunType.rightGun.shoot()
        
        let huntingVC = UIStoryboard(name: "Hunting", bundle: nil).instantiateViewController(withIdentifier: "HuntingViewController") as! HuntingViewController
        //Property DI
        huntingVC.duckType = self.duckType
        huntingVC.gunType = .rightGun
        self.navigationController?.pushViewController(huntingVC, animated: true)
    }
    
    @IBAction func leftGunButtonTapped(_ sender: Any) {
        GunType.leftGun.shoot()
        
        let huntingVC = UIStoryboard(name: "Hunting", bundle: nil).instantiateViewController(withIdentifier: "HuntingViewController") as! HuntingViewController
        //Property DI
        huntingVC.duckType = self.duckType
        huntingVC.gunType = .leftGun
        self.navigationController?.pushViewController(huntingVC, animated: true)
    }
}
