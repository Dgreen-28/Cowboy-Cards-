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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCells", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = dataSource[indexPath[1]].storeTitle
        cell.detailTextLabel?.text = String(dataSource[indexPath[1]].storeCardNum)
        return cell
    }
}
