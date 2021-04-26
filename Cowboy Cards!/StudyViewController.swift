//
//  StudyViewController.swift
//  Cowboy Cards!
//
//  Created by Decoreyon Green on 4/20/21.
//

import UIKit
import CoreData

class StudyViewController: UIViewController{
    var dataSource: [DisplayCard] = []
    var appDelegate: AppDelegate?
    var context: NSManagedObjectContext?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func lastCardButton(_ sender: Any) {
    }
    
    @IBAction func flipCardButton(_ sender: Any) {
    }
    
    @IBAction func nextCardButton(_ sender: Any) {
    }
    @IBOutlet weak var cardView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        context = appDelegate?.persistentContainer.viewContext
    }
    
    override func viewWillAppear(_ animated: Bool) {
        do{
            dataSource = try context?.fetch(DisplayCard.fetchRequest()) ?? []
        }
        catch let error as NSError {
            print("Cannot load data: \(error)")
        }
    }
    
    // Should unwind the values from the table to display, but couldn't figure it out
    @IBAction func unwindFromSave(segue: UIStoryboardSegue){
        // Get the segue source
        //guard let source = segue.source as? TableViewController else {
            //print("Cannot get segue source")
            //return
        //}
        
        // Create a new display record
        //let display = FlashCard(context: context!)
        // Set the attributes of the display
        //titleLabel.text = display.storeTitle
        //cardView.text = display.storeQuestion
    }
}
