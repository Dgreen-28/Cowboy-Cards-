//
//  CreateSetViewController.swift
//  Cowboy Cards!
//
//  Created by Decoreyon Green on 4/20/21.
//
import UIKit
import CoreData

class CreateSetViewController: UIViewController {
    var dataSource: [FlashCard] = []
    var appDelegate: AppDelegate?
    var context: NSManagedObjectContext?

    var questionArray = [String]()
    var answerArray = [String]()

    @IBOutlet weak var setTitleTextField: UITextField!
    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var answerTextView: UITextView!
    
    @IBAction func NextCardButtonTapped(_ sender: Any) {
        if (answerTextView.hasText && questionTextView.hasText && setTitleTextField.hasText) {
            questionArray.append(questionTextView.text)
            answerArray.append(answerTextView.text)
            
            questionTextView.text = ""
            answerTextView.text = ""
            
            print(questionArray)
            print(answerArray)
        }
    }
    
    @IBAction func CreateSetButtonTapped(_ sender: Any) {
        if (answerTextView.hasText && questionTextView.hasText && setTitleTextField.hasText)
        {
            questionArray.append(questionTextView.text)
            answerArray.append(answerTextView.text)
            
            questionTextView.text = ""
            answerTextView.text = ""
            
            print(questionArray)
            print(answerArray)
            
            // Create a new card record
            let card = FlashCard(context: context!)
            // Set attributes
            card.storeTitle = setTitleTextField.text
            card.storeQuestion = questionTextView.text
            card.storeAnswer = answerTextView.text
            card.storeCardNum = Int32(questionArray.count)
            card.storeQuestionArray = questionArray
            card.storeAnswerArray = answerArray
            
            do{
                // Update the data store with managed context
                try context?.save()
                // Add this record to the data source
                dataSource.append(card)
                
            }
            catch let error as NSError {
                print("Cannot save data: \(error)")
            }
        }
    }
    
    // Create var to store to CoreData -Jeremiah
    var setTitleResult = ""
    var questionResult = "" 
    var answerResult = ""
    var cardNum: Int32 = 0
    var questionArrayResult = [String]()
    var answerArrayResult = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        appDelegate = UIApplication.shared.delegate as? AppDelegate
        context = appDelegate?.persistentContainer.viewContext
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        do{
            dataSource = try context?.fetch(FlashCard.fetchRequest()) ?? []
        }
        catch let error as NSError {
            print("Cannot load data: \(error)")
        }
    }
    
    // Prepare segue values to use for CoreData -Jeremiah
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        setTitleResult = setTitleTextField.text ?? "Needs Proper Title"
        questionResult = questionTextView.text ?? "Needs Proper Question"
        answerResult = answerTextView.text ?? "Needs Proper Answer"
        cardNum = Int32(questionArray.count)
        questionArrayResult = questionArray
        answerArrayResult = answerArray
    }
}

