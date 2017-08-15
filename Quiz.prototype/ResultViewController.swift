//
//  ResultViewController.swift
//  Quiz.prototype
//
//  Created by John Daly on 2017/08/15.
//  Copyright © 2017 Recessive Programmer. All rights reserved.
//

import UIKit

class ResultViewController : UIViewController {
    
    @IBOutlet weak var correctPercentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let numQs = QuestionDataManager.sharedInstance.questionDataArray.count
        
        var correctCount: Int = 0
        
        for qData in QuestionDataManager.sharedInstance.questionDataArray {
            if qData.isCorrect() {
                correctCount += 1
            }
        }
        
        let correctPercent: Float = (Float(correctCount) / Float(numQs)) * 100
        
        correctPercentLabel.text = String(format: "%.1f", correctPercent) + "%"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
