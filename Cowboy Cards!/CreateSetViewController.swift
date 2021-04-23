//
//  CreateSetViewController.swift
//  Cowboy Cards!
//
//  Created by Decoreyon Green on 4/20/21.
//
import UIKit

class CreateSetViewController: UIViewController {

    var questionArray = [String]()
    var answerArray = [String]()

    @IBOutlet weak var setTitleTextField: UITextField!
    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var answerTextView: UITextView!
    
    @IBAction func NextCardButtonTapped(_ sender: Any) {
        questionArray.append(questionTextView.text)
        answerArray.append(answerTextView.text)

        questionTextView.text = ""
        answerTextView.text = ""

        print(questionArray)
        print(answerArray)

        
    }
    
    @IBAction func CreateSetButtonTapped(_ sender: Any) {
    }
    
    // Create var to store to CoreData -Jeremiah
    var setTitleResult = ""
    var questionResult = "" // This should be an array value in order to store all values
    var answerResult = ""
    var cardNum: Int32 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Prepare segue values to use for CoreData -Jeremiah
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        setTitleResult = setTitleTextField.text ?? "Needs Proper Title"
        questionResult = questionTextView.text ?? "Needs Proper Question"
        answerResult = answerTextView.text ?? "Needs Proper Answer"
        cardNum = Int32(questionArray.count)
        
    }
}

