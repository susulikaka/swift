//
//  RatingControl.swift
//  SwiftLearn
//
//  Created by SupingLi on 16/9/10.
//  Copyright © 2016年 SupingLi. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    // MARK: properties
    
    var rating  = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    var ratingBtns = [UIButton]()
    let spacing = 5
    let starCount = 5
    
    // MARK: init
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let imgName = UIImage(named: "2")
        let empName = UIImage(named: "1")
        
        for _ in 0..<starCount {
            let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
            btn.setImage(empName, forState: .Normal)
            btn.setImage(imgName, forState: .Selected)
            btn.setImage(imgName, forState: [.Highlighted,.Selected])
            btn.addTarget(self, action: #selector(RatingControl.ratingBtnTap(_:)), forControlEvents: .TouchDown)
            ratingBtns += [btn]
            addSubview(btn)
        }
    }
    
    // MARK: override
    
    override func intrinsicContentSize() -> CGSize {
        let btnSize = Int(frame.size.height)
        let width = (btnSize*starCount+(spacing*(starCount-1)))
        return CGSize(width: width, height: btnSize)
    }
    
    override func layoutSubviews() {
        let btnSize = Int(frame.size.height)
        var btnFrame = CGRect(x: 0, y: 0, width: btnSize, height: btnSize)
        for (index, btn) in ratingBtns.enumerate() {
            btnFrame.origin.x = CGFloat(index*(btnSize+spacing))
            btn.frame = btnFrame
        }
        updateBtnSelectedState()
    }
    
    func updateBtnSelectedState() {
        for (index,btn) in ratingBtns.enumerate() {
            btn.selected = index<rating
        }
    }
    
    func ratingBtnTap(button:UIButton) {
        rating = ratingBtns.indexOf(button)!+1
        updateBtnSelectedState()
    }
    
}
