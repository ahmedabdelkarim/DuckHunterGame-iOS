//
//  HuntingViewController.swift
//  DuckHunter
//
//  Created by Ahmed Abdelkarim on 03/05/2021.
//

import UIKit

class HuntingViewController: UIViewController {
    //MARK: - Properties
    var duckType: DuckType!
    var gunType: GunType!
    
    var currentDuck: Duck?
    let hunter = Hunter()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        startGeneratingDucks()
    }
    
    //MARK: - Methods
    func startGeneratingDucks() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.generateNewDuck()
        }
    }
    
    func generateNewDuck() {
        //Constructor DI
        let duckGenerator = DuckGenerator(minSize: 10, maxSize: 130)
        
        let duck = duckGenerator.generate(ofType: self.duckType)
        currentDuck = duck
        
        for subView in self.view.subviews {
            subView.removeFromSuperview()
        }
        
        let duckImageView = UIImageView()
        duckImageView.frame = CGRect(x: duck.position.x, y: duck.position.y, width: duck.size, height: duck.size)
        duckImageView.image = UIImage(named: duck.type.rawValue)
        duckImageView.contentMode = .scaleAspectFit
        
        self.duckType.quack()
        self.view.addSubview(duckImageView)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.generateNewDuck()
        }
    }
    
    //MARK: - Actions
    @IBAction func huntingViewTapped(_ sender: UITapGestureRecognizer) {
        //make shoot sound
        self.gunType.shoot()
        
        if let duck = self.currentDuck {
            let hunted = hunter.hunt(duck: duck, targetPoint: sender.location(in: self.view))
            
            if hunted {
                currentDuck = nil
                
                for subView in self.view.subviews {
                    subView.removeFromSuperview()
                }
            }
        }
    }
}
