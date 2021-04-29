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

    // Create vars to store to CoreData -Jeremiah
    var getQuestionArray: [String] = []
    var getAnswerArray: [String] = []
    var getAnswer: String = ""
    
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
        card.storeQuestionArray = source.questionArrayResult
        card.storeAnswerArray = source.answerArrayResult
        
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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //Create an alert after pressing the delete button
            let deleteAlert = UIAlertController(title: "Delete", message: "Are you sure you want to delete?", preferredStyle: UIAlertController.Style.alert)
            deleteAlert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: { action in
                    let index = self.dataSource[indexPath.row]
                    self.context?.delete(index)
                    self.dataSource.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                    do{
                        try self.context?.save()
                        self.tableView.reloadData()
                    } catch let error as NSError {
                        print("Cannot save data: \(error)")
                    }
            }))
            deleteAlert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: nil))
            //show alert
            self.present(deleteAlert, animated: true, completion: nil)
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCells", for: indexPath)

        // Configure the cell
        cell.textLabel?.text = dataSource[indexPath[1]].storeTitle
        cell.detailTextLabel?.text = String(dataSource[indexPath[1]].storeCardNum) + " Cards"
        
        return cell
    }
    
    //Select cell func that pushes data to StudyView
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        // Create an instance of StudyView to store data properly
        let svc = storyboard?.instantiateViewController(identifier: "StudyViewController") as! StudyViewController
        svc.studyTitle = dataSource[indexPath[1]].storeTitle ?? "No Title"
        svc.studyQuestion = dataSource[indexPath[1]].storeQuestion ?? "No Question"
        svc.studyAnswer = dataSource[indexPath[1]].storeAnswer ?? "No Answer"
        // Show StudyView without needing to segue
        self.show(svc, sender: self)
    }
}
