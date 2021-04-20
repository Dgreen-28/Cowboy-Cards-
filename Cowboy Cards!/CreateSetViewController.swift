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
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
