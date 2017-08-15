//
//  StartViewController.swift
//  Quiz.prototype
//
//  Created by John Daly on 2017/08/15.
//  Copyright © 2017 Recessive Programmer. All rights reserved.
//

import UIKit

class StartViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // read question data
        QuestionDataManager.sharedInstance.loadQuestions()
        
        // call next view controller
        guard let nextViewController = segue.destination as? QuestionViewController else {
            // failed
            print("why? cannot get next view controller")
            return
        }
        
        // prepare question
        guard let questionData = QuestionDataManager.sharedInstance.nextQuestion() else {
            // failed
            print("why? cannnot prepare question storage")
            return
        }
        
        nextViewController.questionData = questionData
    }
    
    @IBAction func goToTile(_ segue: UIStoryboardSegue) {
        
    }
}
