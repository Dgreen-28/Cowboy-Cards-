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
        
        if(questionTextView.hasText && answerTextView.hasText)
        {
        questionArray.append(questionTextView.text)
        answerArray.append(answerTextView.text)

        questionTextView.text = ""
        answerTextView.text = ""

        print(questionArray)
        print(answerArray)

        }
        
    }
    
    @IBAction func CreateSetButtonTapped(_ sender: Any) {
        if(setTitleTextField.hasText && !questionArray.isEmpty && !answerArray.isEmpty)
        {
            
            func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                
            }
            
            questionArray.removeAll()
            answerArray.removeAll()
            
            setTitleTextField.text = ""
            questionTextView.text = ""
            answerTextView.text = ""
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
