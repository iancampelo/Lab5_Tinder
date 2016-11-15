//
//  CardsViewController.swift
//  Lab5_Tinder
//
//  Created by Ian Campelo on 11/10/16.
//  Copyright © 2016 Ian Campelo. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    var trayOriginalCenter: CGPoint!
    var trayCenterWhenOpen: CGFloat!
    var trayCenterWhenClosed: CGFloat!
    
    
    @IBOutlet weak var imgView: DraggableImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = UIImage(named: "ryan")
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTrayPanGesture(_ sender: UIPanGestureRecognizer) {
        let velocity = sender.velocity(in: imgView)
        
        let translation = sender.translation(in: imgView)
        
        let point = sender.location(in: view)
        
        print("transform - \(imgView.transform)")
        if sender.state == .began{
            trayOriginalCenter = imgView.center
            
        }
        if sender.state == .changed{
            print("transform - \(imgView.transform)")
            //imgView.center = CGPoint(x: trayOriginalCenter.x + translation.x, y: trayOriginalCenter.y)
            if(point.y > 280){
                let rotStrength = min(translation.x / 302, -0.5)
                let rotAngle: CGFloat  = CGFloat(2 * .pi * rotStrength / 16)
                let scaleStrength: CGFloat = 1 - fabs(rotStrength) / 4
                let scale : CGFloat = max(scaleStrength, 0.93)
                imgView.center = CGPoint(x: trayOriginalCenter.x + translation.x, y: trayOriginalCenter.y)
                let transform = CGAffineTransform(rotationAngle: rotAngle)
                let scaleTransform = transform.scaledBy(x: scale, y: scale)
                imgView.transform = scaleTransform
            } else {
                let rotStrength = min(translation.x / 302, 1)
                let rotAngle: CGFloat  = CGFloat(2 * .pi * rotStrength / 16)
                let scaleStrength: CGFloat = 1 - fabs(rotStrength) / 4
                let scale : CGFloat = max(scaleStrength, 0.93)
                imgView.center = CGPoint(x: trayOriginalCenter.x + translation.x, y: trayOriginalCenter.y)
                let transform = CGAffineTransform(rotationAngle: rotAngle)
                let scaleTransform = transform.scaledBy(x: scale, y: scale)
                imgView.transform = scaleTransform
            }
        }
        if sender.state == .ended{
            if(translation.x > 50){
                imgView.center = CGPoint(x: trayOriginalCenter.x - 1500, y: trayOriginalCenter.y)
            } else if(translation.x < -50){
                imgView.center = CGPoint(x: trayOriginalCenter.x + 1500, y: trayOriginalCenter.y)
            }
            UIView.animate(withDuration: 0.8, animations: {
                self.imgView.transform = CGAffineTransform(rotationAngle: 0)
                self.imgView.center = self.trayOriginalCenter
            })
            
        }
    }
    @IBAction func onTapGesture(_ sender: UITapGestureRecognizer) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let profileVC = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        self.present(profileVC, animated: true, completion: nil)
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
