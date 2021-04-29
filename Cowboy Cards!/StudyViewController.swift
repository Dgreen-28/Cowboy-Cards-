//
//  StudyViewController.swift
//  Cowboy Cards!
//
//  Created by Decoreyon Green on 4/20/21.
//

import UIKit
import CoreData

class StudyViewController: UIViewController {
    var stupidLoop = 3
    var dataSource: [FlashCard] = []
    var appDelegate: AppDelegate?
    var context: NSManagedObjectContext?
    var index = 0
    //Should be set to the count of the cards minus 1
    var last = 3
    // Create these values in order to take data from the TableView - Jeremiah
    var studyTitle: String = ""
    var studyQuestion = ""
    var studyAnswer = ""
    var questionArrayValues: [String] = [] // This should be used for data in CreateSet questionArray
    var answerArrayValues: [String] = [] // This should be used for data in CreateSet answerArray
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBAction func lastCardButton(_ sender: Any) {
        if(index == 0)
        {
            //Should not go back since at start
            let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
            let startController = UIAlertController(title: "Start of Set", message: "You are at the start of your Flashcards", preferredStyle: .alert)
            
            startController.addAction(okayAction)
            
            present(startController, animated: true, completion: nil)
        }
        else
        {
            index -= 1
        }
    }
    
    @IBAction func flipCardButton(_ sender: Any) {
        if( stupidLoop % 2 == 0)
        {
            QuestionLabel.text = "Question:"
        }
        else
        {
            QuestionLabel.text = "Answer:"
        }
        self.stupidLoop+=1
    }
    
    @IBAction func nextCardButton(_ sender: Any) {
        if(index == last){
            //Should not go to next since at end
            let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
            let endController = UIAlertController(title: "End of Set", message: "You are at the end of your Flashcards", preferredStyle: .alert)
            
            endController.addAction(okayAction)
            
            present(endController, animated: true, completion: nil)
        }
        else
        {
            index += 1
        }
    }
    
    @IBOutlet weak var cardView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        context = appDelegate?.persistentContainer.viewContext
        
        print(studyTitle)
        print(studyQuestion)
        titleLabel.text = studyTitle
        //cardView.text = studyQuestion
        cardView.isEditable = false
        QuestionLabel.text = "Question:"
        
        print(questionArrayValues)
        print(answerArrayValues)
        
        let csc = storyboard?.instantiateViewController(identifier: "CreateSetViewController") as! CreateSetViewController
        cardView.text = csc.questionResult
    }
    
    override func viewWillAppear(_ animated: Bool) {
        do{
            dataSource = try context?.fetch(FlashCard.fetchRequest()) ?? []
        }
        catch let error as NSError {
            print("Cannot load data: \(error)")
        }
    }
}
