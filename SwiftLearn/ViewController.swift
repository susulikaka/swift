//
//  ViewController.swift
//  SwiftLearn
//
//  Created by SupingLi on 16/9/10.
//  Copyright © 2016年 SupingLi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var okBtn: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var cancelItem: UIBarButtonItem!
    @IBOutlet weak var doneItem: UIBarButtonItem!
    
    var meal:Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameText.delegate = self
        
        if let meal = meal {
            navigationItem.title = meal.name
            nameLabel.text = meal.name
            nameText.text = meal.name
            imgView.image = meal.photo
            ratingControl.rating = meal.rating
        }
        
        imgView.backgroundColor = UIColor.blueColor()
        checkValidMealName()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: preparaForSegue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if doneItem === sender {
            let name = nameText.text ?? ""
            let photo = imgView.image
            let rating = ratingControl.rating
            
            meal = Meal(name: name, photo: photo, rating: rating)
        }
    }
    
    //AMRK: private method
    
    func checkValidMealName() {
        let text = nameText.text ?? ""
        doneItem.enabled = !text.isEmpty
    }
    
    // MARK: UITextFieldDelegate
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        checkValidMealName()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        nameLabel.text = nameText.text
        checkValidMealName()
    }
    
    // MARK UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImg = info[UIImagePickerControllerOriginalImage] as! UIImage
        imgView.image = selectedImg
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
    }
    
    // MARK action
    
    @IBAction func tapAction(sender: UITapGestureRecognizer) {
        nameText.resignFirstResponder()
        let imgPicker = UIImagePickerController()
        imgPicker.delegate = self
        imgPicker.sourceType = .PhotoLibrary
        presentViewController(imgPicker, animated: true, completion: nil)
    }
    
    @IBAction func okAction(sender: UIButton) {
        nameText.resignFirstResponder()
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

}

