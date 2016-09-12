//
//  MealTableViewController.swift
//  SwiftLearn
//
//  Created by SupingLi on 16/9/10.
//  Copyright © 2016年 SupingLi. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    
    // MARK: properties
    
    var meals = [Meal]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedMeals = loadMeals() {
            meals += savedMeals
        } else {
            loadSampleMeals()
        }
    }
    
    // MARK: private method
    
    func loadSampleMeals() {
        let photo1 = UIImage(named: "1")!
        let meal1 = Meal(name: "1", photo: photo1, rating: 4)!
        
        let photo2 = UIImage(named: "2")!
        let meal2 = Meal(name: "2", photo: photo2, rating: 5)!
        
        let photo3 = UIImage(named: "3")!
        let meal3 = Meal(name: "3", photo: photo3, rating: 3)!
        
        let photo4 = UIImage(named: "4")!
        let meal4 = Meal(name: "4", photo: photo4, rating: 2)!
        
        meals += [meal1, meal2, meal3, meal4]
          
    }
    
    // MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            let mealDetailVC = segue.destinationViewController as! ViewController
            if let selectedCell = sender as? MealTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedCell)!
                let selectedMeal = meals[indexPath.row]
                mealDetailVC.meal = selectedMeal
            }
        } else if segue.identifier == "addItem" {
            print("Adding a new meal")
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellID = "MealTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath) as! MealTableViewCell
        let meal = meals[indexPath.row]
        cell.imageView?.image = meal.photo
        cell.nameLabel.text = meal.name
        cell.ratingControl.rating = meal.rating
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return .Delete
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            meals.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Left)
            saveMeal()
        } else if editingStyle == .Insert {
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Right)
        }
    }
    
    // MARK: NSCoding
    
    func saveMeal() {
        let isSuccessSave = NSKeyedArchiver.archiveRootObject(meals, toFile: Meal.archiveUrl.path!)
        if !isSuccessSave {
            print("fail to save meals.")
        }
    }
    
    func loadMeals() -> [Meal]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(Meal.archiveUrl.path!) as? [Meal]
    }
    
    // MARK: left and right method
    
    @IBAction func back(sender: UIStoryboardSegue) {
        
    }
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as?
            ViewController, meal = sourceViewController.meal {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                meals[selectedIndexPath.row] = meal
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            } else {
                let newIndexPath = NSIndexPath(forRow: meals.count, inSection: 0)
                meals.append(meal)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
            saveMeal()
        }
    }
    
}
