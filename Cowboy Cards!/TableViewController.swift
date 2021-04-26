//
//  TableViewController.swift
//  Cowboy Cards!
//
//  Created by Jeremiah Jaylen Pete on 4/20/21.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    var dataSource: [FlashCard] = []
    var appDelegate: AppDelegate?
    var context: NSManagedObjectContext?

    override func viewDidLoad() {
        super.viewDidLoad()

        appDelegate = UIApplication.shared.delegate as? AppDelegate
        context = appDelegate?.persistentContainer.viewContext
    }
    
    override func viewWillAppear(_ animated: Bool) {
        do{
            dataSource = try context?.fetch(FlashCard.fetchRequest()) ?? []
        }
        catch let error as NSError {
            print("Cannot load data: \(error)")
        }
    }

    @IBAction func unwindFromSave(segue: UIStoryboardSegue) {
        // Get the segue source - Jeremiah
        guard let source = segue.source as? CreateSetViewController else {
            print("Cannot get segue source")
            return
        }
        
        // Create a new card record
        let card = FlashCard(context: context!)
        // Set the attributes in the new card record
        card.storeTitle = source.setTitleResult
        card.storeQuestion = source.questionResult
        card.storeAnswer = source.answerResult
        card.storeCardNum = source.cardNum
        
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
    
    // Prepare segue values to use for CoreData -Jeremiah
    // I believe this is the key to getting the data to the study view
    
    // Create vars to store to CoreData -Jeremiah
    var setTitle = ""
    var setQuestion = ""

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
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
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            dataSource.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//            tableView.reloadData()
//
//        } else if editingStyle == .insert {
            
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
  //      }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dataSource.remove(at: indexPath.row)
            //may have to "context" & "appDelegate"
            tableView.reloadData()
        }
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCells", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = dataSource[indexPath[1]].storeTitle
        cell.detailTextLabel?.text = String(dataSource[indexPath[1]].storeCardNum) + " Cards"
        
        return cell
    }
}
