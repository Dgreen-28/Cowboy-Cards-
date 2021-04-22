//
//  StudyViewController.swift
//  Cowboy Cards!
//
//  Created by Decoreyon Green on 4/20/21.
//

import UIKit
import CoreData

class StudyViewController: UIViewController{
    var dataSource: [NSManagedObject] = []
    var appDelegate: AppDelegate?
    var context: NSManagedObjectContext?
    var entity: NSEntityDescription?
    var tvc = TableViewController()
    
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
        entity = NSEntityDescription.entity(forEntityName: "FlashCard", in: context!)
        
    }
}
