//
//  ProfileImageView.swift
//  Lab5_Tinder
//
//  Created by Ian Campelo on 11/15/16.
//  Copyright © 2016 Ian Campelo. All rights reserved.
//

import UIKit

class ProfileImageView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
        initSubviews()
    }
    func initSubviews(){
        let nib = UINib(nibName: "ProfileImageView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }
    
    
    var image: UIImage?{
        get{ return imgView.image}
        set{ imgView.image = newValue}
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
