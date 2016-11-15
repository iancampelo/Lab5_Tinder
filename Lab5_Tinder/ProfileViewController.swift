//
//  ProfileViewController.swift
//  Lab5_Tinder
//
//  Created by Ian Campelo on 11/15/16.
//  Copyright © 2016 Ian Campelo. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var imgView: ProfileImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = UIImage(named: "ryan")
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapNavBar(_ sender: UITapGestureRecognizer) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let cardsVC = storyboard.instantiateViewController(withIdentifier: "CardsViewController") as! CardsViewController
        self.present(cardsVC, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
