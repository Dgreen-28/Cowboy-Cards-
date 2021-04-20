//
//  TableViewController.swift
//  Cowboy Cards!
//
//  Created by Jeremiah Jaylen Pete on 4/20/21.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    var dataSource: [NSManagedObject] = []
    var appDelegate: AppDelegate?
    var context: NSManagedObjectContext?
    var entity: NSEntityDescription?

    override func viewDidLoad() {
        super.viewDidLoad()

        appDelegate = UIApplication.shared.delegate as? AppDelegate
        context = appDelegate?.persistentContainer.viewContext
        entity = NSEntityDescription.entity(forEntityName: "FlashCard", in: context!)
    }
    
    @IBAction func unwindFromSave(segue: UIStoryboardSegue) {
        // Get the segue source - Jeremiah
        guard let source = segue.source as? CreateSetViewController else {
            print("Cannot get segue source")
            return
        }
        
        if let entity = self.entity {
            // Create a new card record
            let card = NSManagedObject(entity: entity, insertInto: context)
            // Set the attributes in the new card record
            card.setValue(source.setTitleResult, forKey: "storeTitle")
            card.setValue(source.questionResult, forKey: "storeQuestion")
            card.setValue(source.answerResult, forKey: "storeAnswer")
            card.setValue(source.cardNum, forKey: "storeCardNum")
            
            do {
               // Update the data store with the managed context
                try context?.save()
                // Add this record to the table view data source
                dataSource.append(card)
                // Reload the data in the table view
                self.tableView.reloadData()
            }
            catch let error as NSError {
                print("Cannot save data: \(error)")
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = dataSource[indexPath[1]].value(forKey: "storeTitle") as? String
        cell.detailTextLabel?.text = dataSource[indexPath[1]].value(forKey: "storeCardNum") as? String
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Fetch the database content
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FlashCard")
        
        do{
            dataSource = try context?.fetch(fetchRequest) ?? []
        }
        catch let error as NSError {
            print("Cannot load data: \(error)")
        }
    }
}
